--USING 1 TABLE 


--MANTADORY UNDERGRAD COURSES
SELECT CourseName, 
FROM COURSE
WHERE COURSE.CLevel = 1 AND COURSE.CType = 1

COUNT OF FACULTY MEMBERS RESEARCHING EACH AREA
SELECT ResearchArea AS research_area, COUNT(*) AS Number_of_faculty_members
FROM RESEARCH_AREAS
GROUP BY RESEARCH_AREAS.ResearchArea



--USING 2 TABLES


COUNT OF COURSES FOR EACH CURRICULUM
SELECT CurriculumId AS Id_of_Curriculum, COUNT(*) AS Number_of_courses
FROM CURRICULUM_COURSE_LIST, COURSE
WHERE CURRICULUM_COURSE_LIST.CourseCode = COURSE.Code
GROUP BY CurriculumId

NAMES AND CODES OF THE COURSES ORDERED BY CURRICULUM
SELECT  CurriculumId AS Id_of_Curriculum, COURSE.Code AS Course_code, COURSE.CName AS Course_name
FROM CURRICULUM_COURSE_LIST, COURSE
WHERE CURRICULUM_COURSE_LIST.CourseCode = COURSE.Code
ORDER BY CurriculumId

SECTIONS STUDENTS TOOK AND THEIR GRADES ORDERED BY STUDENT NUMBER THEN YEAR
SELECT STUDENT_SECTION.StudentId AS student_id, SECTION.Year AS year,  SECTION.Id AS section_id, STUDENT_SECTION.Grade AS grade
FROM SECTION, STUDENT_SECTION
WHERE SECTION.Id = STUDENT_SECTION.SectionId
ORDER BY STUDENT_SECTION.StudentId, year

COUNT OF STUDENTS IN EACH SECTION 
SELECT SECTION.Id AS section_Id, COUNT(*) AS Number_of_students
FROM SECTION, STUDENT_SECTION 
WHERE SECTION.Id = STUDENT_SECTION.SectionId  
GROUP BY SECTION.Id



USING 3 TABLES 
TOTAL CREDITS OF SECTIONS A STUDENT TOOK IN A SEMESTER
SELECT SS.StudentId, S.Sem, SUM(C.Credits) AS total_credits
FROM STUDENT_SECTION AS SS, SECTION AS S, COURSE AS C
WHERE SS.SectionId = S.Id
AND S.CourseCode = C.Code
GROUP BY SS.StudentID, S.Sem
ALL COURSES OF GIVEN DEPARTMENT
SELECT CURR.Id, CURR.CDesc AS curriculum_description, C.Code AS course_code, C.CName AS course_name
FROM CURRICULUM AS CURR, CURRICULUM_COURSE_LIST AS CLIST, COURSE AS C
WHERE CURR.Id = CLIST.CurriculumId
AND CLIST.CourseCode = C.Code
AND CURR.DeptId = 1
ORDER BY CURR.Id
LIST ALL NON-TECHNICAL OPTIONAL SECTIONS ORDERED BY STUDENT ID
SELECT S.Id AS student_�d, C.CName AS course_name, S.Bldg AS section_building
FROM STUDENT_SECTION AS SS, SECTION AS S, COURSE AS C
WHERE SS.SectionId = S.Id
AND S.CourseCode = C.Code
AND C.CType = 3
ORDER BY S.Id
ORIGINAL SELECT STATEMENTS 
NUMBER OF STUDENTS IN EACH DEPARTMENT GROUPED BY DEPARTMENT NAME
SELECT DEPT.DName,COUNT(*) AS number_of_students 
FROM STUDENT, DEPT
WHERE STUDENT.DeptId = DEPT.Id
GROUP BY Dname
AVERAGE GRADES OF SECTIONS
SELECT SectionId AS section_id, AVG(Grade) AS class_average, COUNT(*) AS number_of_students
FROM STUDENT_SECTION 
GROUP BY SectionId
LECTURERS ORDERED BY DESCENDING AVG GRADES OF ALL SECTIONS THEY GIVE
SELECT FMName, AVG(Grade) AS average_grade
FROM STUDENT_SECTION AS SS, SECTION, LECTURER, FACULTY_MEMBER
WHERE SS.SectionId = SECTION.Id 
AND SECTION.LecturerId=LECTURER.Id
AND LECTURER.Id = FACULTY_MEMBER.Id
GROUP BY FMName
ORDER BY average_grade DESC
PROFESSOR WITH LONGEST TIME SERVED AS CHAIR OF DEPARTMENT
SELECT TOP(1) CHAIR.Id, DEPT.DName, CHAIR.StartDate, CHAIR.EndDate
FROM CHAIR, DEPT
WHERE CHAIR.DeptId = DEPT.Id
ORDER BY DATEDIFF(day, StartDate, EndDate) DESC

STUDENTS WITH MOST FAILED SECTIONS
SELECT StudentId, COUNT(*) AS failed_section_count
FROM STUDENT_SECTION AS SS
WHERE SS.Grade <> 0.00
AND SS.Grade < 2.00
GROUP BY SS.StudentId