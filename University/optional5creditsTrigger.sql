CREATE TRIGGER OptionalCreditLimit
ON COURSE
AFTER INSERT, UPDATE
AS
BEGIN
    
    DECLARE @CourseType nchar(15);
    DECLARE @Credits INT;

    SELECT @CourseType = INSERTED.CourseType
    FROM INSERTED

    SELECT @Credits = INSERTED.Credits 
    FROM INSERTED
    
    IF @CourseType = 'optional' AND @Credits > 4
    BEGIN
        -- If it does, raise an error
        RAISERROR('Error: Optional courses cannot have more than 5 credits', 16, 1);

        ROLLBACK TRANSACTION;
    END
END;

insert into Course values ('deneme', 'trigger', 5, '2', 'description', 'optional');