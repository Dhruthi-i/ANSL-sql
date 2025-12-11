
-- CREATE DATABASE organization;

-- USE organization;

CREATE TABLE school_Teachers(
id INT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
dept VARCHAR(20) NOT NULL,
salary INT DEFAULT 30000
);

CREATE TABLE school_Students(
id INT PRIMARY KEY,
name VARCHAR(20),
lecture VARCHAR(20),
marks INT 
);

ALTER TABLE school_Students
ADD teacher_id INT;

ALTER TABLE school_Students
ADD CONSTRAINT fk_teacher
FOREIGN KEY (teacher_id) REFERENCES school_Teachers(id);

INSERT INTO school_Teachers (id, name, dept, salary) VALUES
(1, 'Mr. Sharma', 'Math', 45000),
(2, 'Ms. Rao',   'Science', 42000),
(3, 'Mr. Khan',  'English', 40000),
(4, 'Mrs. Das',  'Computer', 50000);

INSERT INTO school_Students (id, name, lecture, marks, teacher_id) VALUES
(101, 'Amit',   'Math',     85, 1),
(102, 'Neha',   'Math',     78, 1),
(103, 'Rahul',  'Science',  92, 2),
(104, 'Priya',  'Science',  88, 2),
(105, 'Sana',   'English',  75, 3),
(106, 'Ankit',  'Computer', 95, 4);

SELECT *FROM school_Teachers;
SELECT *FROM school_Students;

-- 1. Display all students with their teacher's name.
-- SELECT ss.name AS "student name", st.name AS "teacher name"
-- FROM school_Students ss JOIN school_Teachers st
-- ON ss.teacher_id = st.id;

-- 2. Show students who scored more than 80 marks.
-- SELECT name,marks
-- FROM school_Students 
-- WHERE marks > 80;

-- 3. List all teachers from the 'Science' department.
-- SELECT name,dept
-- FROM school_Teachers
-- WHERE  dept = 'Science';

-- 4. Show students sorted by marks (highest first).
-- SELECT name,marks
-- FROM school_Students
-- ORDER BY marks DESC;

-- 5. Count total number of students.
-- SELECT count(id) AS 'TOATAL NO OF STUDENT'
-- FROM school_Students;

-- 6. Show each teacher with number of students assigned.
-- SELECT st.name AS 'teacher name',count(ss.id) AS 'number OF students'
-- FROM school_Teachers st
-- LEFT JOIN school_Students ss ON st.id = ss.teacher_id
-- group BY st.id;

-- 7. Get student name, lecture, teacher name, and department.
-- SELECT ss.name AS "STUDENT NAME", ss.lecture , st.name AS "TEACHER NAME", st.dept
-- FROM school_Students ss full join school_Teachers st
-- ON ss.teacher_id=st.id;

-- 8. Show students who belong to the 'Math' lecture.
-- SELECT name,lecture
-- FROM school_Students
-- WHERE lecture='Math';

-- 9. Display teachers who earn more than 40,000 salary.
-- SELECT name,salary
-- from school_Teachers
-- WHERE salary > 40000;

-- 10. Find the highest marks scored.
SELECT name, marks
FROM school_Students
WHERE marks = (SELECT MAX(marks) FROM school_Students);













