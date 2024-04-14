
create table CourseKeyword (
	C_KeywordID int NOT NULL,
    CourseCode nchar(16) NOT NULL,
    primary key (C_KeywordID, CourseCode)
);

INSERT INTO CourseKeyword (C_KeywordID, CourseCode)
VALUES
(1, 'TEC-4'),
(2, '501003222010'),
(3, '501003222010'),
(4, '501001072022'),
(4, '501001122022'),
(4, '501002042010'),
(5, '501002042010'),
(6, '501001122022'),
(6, '501001162010'),
(6, '501002042010'),
(6, '501003242022'),
(7, '501003222010'),
(8, '501002242010'),
(9, '501003222010'),
(10, '105101T12022'),
(12, '501003362018'),
(13, 'TEC-4'),
(14, 'TEC.ELEC.-3'),
(15, 'TEC.ELEC.-3');

select * from CourseKeyword;