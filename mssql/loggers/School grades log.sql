--
-- Version: Each entry records a grade received for a course during the specified term.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/School_grades.json
--
CREATE TABLE [dbo].[School grades log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[term_start_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[term_end_date_id] INT NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[instructor_id] INT NULL,
	[education_level_isced] INT NOT NULL, -- referencing International Standard Classification of Education ISCED 2011
	[subject_name] NVARCHAR (512) NOT NULL,
	[grade_point] INT NULL,
	[grade_desc] NVARCHAR (64) NULL, -- Excellent, Very Good, Good, Accepted, Failed
	[grade_point_minimum] INT NULL, -- maximum value supported by the grading system (e.g. 0)
	[grade_point_maximum] INT NULL, -- the minimum value supported by the grading system (e.g 10)
	[grade_letter] NVARCHAR(1) NULL, -- e.g. A=Excelent, B=Good, C=Average, D=Below Average, F=Failing
	[remarks] NVARCHAR(4000) NULL,   
	CONSTRAINT [PK_School grades log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_School grades log-Calendar_date1] FOREIGN KEY ([term_start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_School grades log-Calendar_date2] FOREIGN KEY ([term_end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_School grades log-People1] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_School grades log-People2] FOREIGN KEY ([instructor_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_School grades-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_School log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([education_level_isced] >= 0 AND [education_level_isced] <= 8),
	CHECK ([grade_desc] = 'distinguished' OR [grade_desc] = 'excellent' OR [grade_desc] = 'very good' OR [grade_desc] = 'good' OR [grade_desc] = 'accepted' OR [grade_desc] = 'failed')
)
