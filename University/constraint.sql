
--Dean can not start to work in the future.
ALTER TABLE Collage
ADD CONSTRAINT DeanStartDate CHECK (DeanStartDate <= GetDate() );

-- Grade should be between 0 to 100.
ALTER TABLE TakenSection
ADD CONSTRAINT GradeCheck CHECK (Grade < 0  AND Grade > 100 OR Grade= null);

-- credit of a course can not be smaller than 0 or greater than 10.
ALTER TABLE Course
ADD CONSTRAINT CreditCheck CHECK (Credits < 0  AND Credits > 10 or Credits = null);
