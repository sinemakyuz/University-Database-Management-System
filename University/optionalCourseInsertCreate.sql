create table OptionalCourse (
	CourseCode nchar(16) PRIMARY KEY,
    TechType varchar(15) NOT NULL
);

INSERT INTO OptionalCourse(CourseCode, TechType)
VALUES
('105101T12022' , 'technical'),
('501001232022' , 'technical'), 
('501002262022' , 'technical'),   
('501003242022' , 'technical'),
('501004082022' , 'non-technical'), 
('501004342022' , 'technical'),  
('501004432022' , 'technical'),  
('501004652022' , 'technical'),   
('TEC.ELEC.-2' , 'technical'),  
('TEC.ELEC.-3' , 'technical'),  
('TEC.ELEC.-I' , 'technical'),   
('TEC-4' , 'technical'),        
('UNI.ELEC.-2'  , 'non-technical'),   
('UNI.ELEC.COU'  , 'non-technical') ; 
select * from Course where CourseType = 'optional';