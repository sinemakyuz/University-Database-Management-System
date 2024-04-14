create database University;

use university;

create table Collage (
	CollageName varchar(20) PRIMARY KEY,
	CollageOffice varchar(12) NOT NULL,
	CollagePhone varchar(11) NULL,
	DeanSSN int NOT NULL,
	DeanStartDate date NOT NULL)
	);
    
create table Department (
	DeptCode int IDENTITY (1,1) PRIMARY KEY,
	DeptName varchar(50) NOT NULL,
	DeptOffice varchar(12) NOT NULL,
	DeptPhone varchar(11) NOT NULL,
	CollageName varchar(20) NOT NULL,
	DeptType varchar(30) NOT NULL,
	ChairSSN int NOT NULL,
	ChairStartDate date NOT NULL);
    
create table Course (
	CourseCode varchar(20) PRIMARY KEY,
	CourseName varchar(50) NOT NULL,
	Credits int NOT NULL,
	CourseLevel int NOT NULL,
	CourseDescription varchar(50) NOT NULL,
	CourseType varchar(15) NOT NULL);
    
create table FacultyMember (
	FM_SSN int IDENTITY (1,1) PRIMARY KEY,
	FM_FirstName varchar(15) NOT NULL,
	FM_MiddleName varchar(15),
	FM_LastName varchar(15) NOT NULL,
	FM_Address varchar(50),
	FM_Phone varchar(11),
	FM_Office varchar(12),
	FM_Rank varchar(20) NOT NULL,
	FM_DeptCode int NOT NULL);
    
create table Student (
	StudentID int IDENTITY (1,1) PRIMARY KEY,
	S_Address varchar(30),
	S_Phone varchar(11),
	S_Major varchar(16) NOT NULL,
	S_DOB date,
	S_FName varchar(15) NOT NULL,
    S_MName varchar(15),
	S_LName varchar(15) NOT NULL,
	S_DeptCode int NOT NULL);
    
create table UniProf (
	UniProfSSN int PRIMARY KEY,
	ProfType varchar(16) NOT NULL );
    
create table Section (
	SecID int IDENTITY (1,1) PRIMARY KEY,
	SecNo int NOT NULL,
	DaysTime varchar(16) NOT NULL,
	Semester int NOT NULL,
	Building varchar(10),
	RoomNo varchar(5),
	SecYear smallint NOT NULL,
	CourseCode varchar(20) NOT NULL,
	SecType varchar(12) NOT NULL,
	Prof_SSN int
);

create table UndergradSec (
	SecID int PRIMARY KEY,
	InstructorSSN int NOT NULL
);

create table TakenSection (
	StudentID int NOT NULL,
	SecID int NOT NULL,
	Transcript int,
    PRIMARY KEY (StudentID, SecID)
);

create table OptionalCourse (
	CourseCode varchar(20) PRIMARY KEY,
    TechType varchar(15) NOT NULL
);

create table Curriculum (
	CurrNo int PRIMARY KEY,
    CurrDeptCode int NOT NULL,
    CreationDate date
);

create table ResearchArea (
	AreaID int IDENTITY (1,1) PRIMARY KEY,
    AreaName varchar(40) NOT NULL
);

create table Keyword (
	KeywordID int IDENTITY (1,1) PRIMARY KEY,
    Keyword varchar(40) NOT NULL
);

create table Thesis (
	ThesisNo int IDENTITY (1,1) primary key,
	Title varchar(50) NOT NULL,
	ThesisDate date,
	ThesisType varchar(8) NOT NULL,
	AuthorSSN int NOT NULL
);

create table CourseKeyword (
	C_KeywordID int NOT NULL,
    CourseCode varchar(20) NOT NULL,
    primary key (C_KeywordID, CourseCode)
);

create table ResearchAreaKeyword (
	R_KeywordID int NOT NULL,
	R_AreaID int NOT NULL,
    primary key (R_KeywordID, R_AreaID)
);

create table Researches (
	ResearcherSSN int NOT NULL,
    R_AreaID int NOT NULL,
    primary key (ResearcherSSN, R_AreaID)
);

create table ComposedOf (
	CurrNo int NOT NULL,
    CourseCode varchar(20) NOT NULL,
    MatchingCriteria int,
    primary key (CurrNo, CourseCode)
);