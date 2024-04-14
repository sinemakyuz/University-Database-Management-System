CREATE TRIGGER tr_EnforceCreditLimit
ON TakenSection
AFTER INSERT
AS
BEGIN
    DECLARE @StudentID INT;
    DECLARE @CourseCode VARCHAR(10);
    DECLARE @Credits INT;
    DECLARE @TotalCredits INT;

    -- Get the student ID and course code of the inserted row
    SELECT @StudentID = StudentID, @CourseCode = C.CourseCode
    FROM inserted I
    INNER JOIN Section S ON I.SectionID = S.SectionID
    INNER JOIN Course C ON S.Course_Code = C.CourseCode;

    -- Get the number of credits for the course
    SELECT @Credits = Credits
    FROM Course
    WHERE CourseCode = @CourseCode;

    -- Calculate the total number of credits the student is taking
    SELECT @TotalCredits = SUM(Credits)
    FROM TakenSection TS
    INNER JOIN Section S ON TS.SectionID = S.SectionID
    INNER JOIN Course C ON S.CourseCode = C.CourseCode
    WHERE TS.StudentID = @StudentID;

    -- If the total number of credits would exceed the limit, roll back the insert
    IF (@TotalCredits + @Credits > 30)
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('The maximum number of credits that can be taken is 30.', 16, 1);
    END
END;


select * from TakenSection;
insert into TakenSection values(15, 14, 87);