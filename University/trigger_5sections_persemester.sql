CREATE TRIGGER StudentSectionLimit
ON TakenSection
AFTER INSERT
AS
BEGIN

    DECLARE @Semester NCHAR(50);
    DECLARE @SectionId INT;
    DECLARE @StudentId INT;

    SELECT @StudentId= StudentID FROM inserted
    
    SELECT @SectionId = inserted.SectionID FROM inserted
    
    SELECT @Semester = Section.Semester 
    FROM Section
    WHERE Section.SectionID = @SectionId;

    IF (SELECT COUNT(*) FROM TakenSection AS TS
        INNER JOIN Section ON Section.SectionID = TS.SectionId
        WHERE TS.StudentID = @StudentId AND Section.Semester = @Semester) > 5

    BEGIN
        -- If it does, raise an error
        RAISERROR('Error: Students are not allowed to enroll in more than %d sections', 16, 1, 5);

        -- Rollback the transaction to undo the insert or update
        ROLLBACK TRANSACTION;
    END
END
select * from TakenSection where StudentID = 15;
insert into TakenSection values (1, 26,20);
