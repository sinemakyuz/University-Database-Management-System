create trigger dean_start_date_trigger
ON Collage
AFTER UPDATE
AS
BEGIN
  DECLARE @dean_start_date VARCHAR(50);
  SELECT @dean_start_date = DeanStartDate FROM Collage WHERE DeanStartDate = (SELECT DeanStartDate FROM uptaded);
  IF @dean_start_date > 
  BEGIN
    RAISERROR('DEAN MUST BE A PROFESSOR.', 16, 1);
    ROLLBACK TRANSACTION;
  END
END