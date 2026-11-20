
require('dotenv').config();

const express = require('express');
const cors = require('cors');
const pool = require('./db');

const app = express();

app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 3000;

// Test API and database connection
app.get('/api/health', async (req, res) => {
  try {
    await pool.query('SELECT 1');

    res.json({
      success: true,
      message: 'API and database are connected.',
    });
  } catch (error) {
    console.error('Database connection error:', error.message);

    res.status(500).json({
      success: false,
      message: 'Database connection failed.',
    });
  }
});

// Retrieve existing students
app.get('/api/students', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT
        s.student_id,
        s.student_number,
        s.student_name,
        s.program_id,
        p.program_code,
        p.program_name,
        s.first_name,
        s.last_name,
        s.email,
        s.course,
        s.year_level,
        s.contact_number,
        s.created_at
      FROM students s
      LEFT JOIN programs p
        ON s.program_id = p.program_id
      ORDER BY s.student_id;
    `);

    res.json({
      success: true,
      count: result.rows.length,
      students: result.rows,
    });
  } catch (error) {
    console.error('Student retrieval error:', error.message);

    res.status(500).json({
      success: false,
      message: 'Unable to retrieve students.',
    });
  }
});

// Add a new student
app.post('/api/students', async (req, res) => {
  try {
    const {
      student_number,
      student_name,
      course,
      year_level,
      email,
      contact_number,
    } = req.body;

    // Check required fields
    if (
      !student_number ||
      !student_name ||
      !course ||
      !year_level ||
      !email
    ) {
      return res.status(400).json({
        success: false,
        message: 'Please provide all required student information.',
      });
    }

    // Check year level
    const yearMatch = String(year_level).match(/^([1-4])/);

    if (!yearMatch) {
      return res.status(400).json({
        success: false,
        message: 'Invalid year level.',
      });
    }

    const yearNumber = Number(yearMatch[1]);

    // Find the program ID using its program code
    const programResult = await pool.query(
      `SELECT program_id
       FROM programs
       WHERE UPPER(program_code) = UPPER($1)`,
      [course]
    );

    if (programResult.rows.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'Invalid course or program code.',
      });
    }

    const programId = programResult.rows[0].program_id;

    // Separate the first name and last name
    const nameParts = student_name.trim().split(/\s+/);
    const firstName = nameParts[0];
    const lastName = nameParts.slice(1).join(' ');

    // Insert student into Neon
    const result = await pool.query(
      `INSERT INTO students (
        student_number,
        student_name,
        program_id,
        first_name,
        last_name,
        email,
        course,
        year_level,
        contact_number
      )
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
      RETURNING *`,
      [
        student_number.trim(),
        student_name.trim(),
        programId,
        firstName,
        lastName,
        email.trim(),
        course.toUpperCase(),
        yearNumber,
        contact_number || null,
      ]
    );

    res.status(201).json({
      success: true,
      message: 'Student added successfully.',
      student: result.rows[0],
    });
  } catch (error) {
    console.error('Student creation error:', error.message);

    if (error.code === '23505') {
      return res.status(409).json({
        success: false,
        message: 'Student ID or another unique field already exists.',
      });
    }

    res.status(500).json({
      success: false,
      message: 'Unable to add student.',
    });
  }
});


// Update an existing student
app.put('/api/students/:id', async (req, res) => {
  try {
    const studentId = Number(req.params.id);

    const {
      student_number,
      student_name,
      course,
      year_level,
      email,
      contact_number,
    } = req.body;

    // Validate the internal database ID.
    if (!Number.isInteger(studentId) || studentId <= 0) {
      return res.status(400).json({
        success: false,
        message: 'Invalid student database ID.',
      });
    }

    // Check required fields.
    if (
      !student_number?.trim() ||
      !student_name?.trim() ||
      !course?.trim() ||
      !year_level ||
      !email?.trim()
    ) {
      return res.status(400).json({
        success: false,
        message: 'Please provide all required student information.',
      });
    }

    // Validate year level.
    const yearMatch = String(year_level).match(
      /^([1-4])(st|nd|rd|th)?(\s+Year)?$/i
    );

    if (!yearMatch) {
      return res.status(400).json({
        success: false,
        message: 'Invalid year level.',
      });
    }

    const yearNumber = Number(yearMatch[1]);

    // Find the program ID.
    const courseCode = course.trim().toUpperCase();

    const programResult = await pool.query(
      `SELECT program_id
       FROM programs
       WHERE UPPER(program_code) = $1`,
      [courseCode]
    );

    if (programResult.rows.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'Invalid course or program code.',
      });
    }

    const programId = programResult.rows[0].program_id;

    // Separate first name and last name.
    const nameParts = student_name.trim().split(/\s+/);
    const firstName = nameParts[0];
    const lastName = nameParts.slice(1).join(' ');

    // Update the student record in Neon.
    const result = await pool.query(
      `UPDATE students
       SET
         student_number = $1,
         student_name = $2,
         program_id = $3,
         first_name = $4,
         last_name = $5,
         email = $6,
         course = $7,
         year_level = $8,
         contact_number = $9
       WHERE student_id = $10
       RETURNING *`,
      [
        student_number.trim(),
        student_name.trim(),
        programId,
        firstName,
        lastName,
        email.trim(),
        courseCode,
        yearNumber,
        contact_number?.trim() || null,
        studentId,
      ]
    );

    // Check whether the student exists.
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Student not found.',
      });
    }

    res.json({
      success: true,
      message: 'Student updated successfully.',
      student: result.rows[0],
    });
  } catch (error) {
    console.error('Student update error:', error.message);

    if (error.code === '23505') {
      return res.status(409).json({
        success: false,
        message: 'Student ID or another unique field already exists.',
      });
    }

    res.status(500).json({
      success: false,
      message: 'Unable to update student.',
    });
   }
});


// Delete a student
app.delete('/api/students/:id', async (req, res) => {
  try {
    const studentId = Number(req.params.id);

    // Validate the student ID.
    if (!Number.isInteger(studentId) || studentId <= 0) {
      return res.status(400).json({
        success: false,
        message: 'Invalid student ID.',
      });
    }

    // Delete the student from the database.
    const result = await pool.query(
      'DELETE FROM students WHERE student_id = $1 RETURNING *',
      [studentId]
    );

    // Check whether the student exists.
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Student not found.',
      });
    }

    res.json({
      success: true,
      message: 'Student deleted successfully.',
      student: result.rows[0],
    });
  } catch (error) {
    console.error('Student deletion error:', error.message);

    res.status(500).json({
      success: false,
      message: 'Unable to delete student.',
    });
  }
});

// Start the server after registering all routes.
app.listen(PORT, () => {
  console.log(`Student Directory API running on port ${PORT}`);
});