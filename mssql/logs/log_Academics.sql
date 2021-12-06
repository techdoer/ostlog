--
-- Version: Each entry records a grade received for a course during the specified term.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/log_Academics.json
--
CREATE TABLE [dbo].[log_Academics]
(
	[id] INT IDENTITY (1,1) NOT NULL,
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
	CONSTRAINT [PK_log_Academics] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_log_Academics-Calendar_dates1] FOREIGN KEY ([term_start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_log_Academics-Calendar_dates2] FOREIGN KEY ([term_end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_log_Academics-People1] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_log_Academics-People2] FOREIGN KEY ([instructor_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_log_Academics-Locations] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id]),

	CHECK ([education_level_isced] >= 0 AND [education_level_isced] <= 8),
	CHECK ([grade_desc] = 'distinguished' OR [grade_desc] = 'excellent' OR [grade_desc] = 'very good' OR [grade_desc] = 'good' OR [grade_desc] = 'accepted' OR [grade_desc] = 'failed' OR [grade_desc] = 'advanced' OR [grade_desc] = 'intermediate' OR [grade_desc] = 'basic' OR [grade_desc] = 'beginning')
)
