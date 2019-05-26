--
-- Version: Each entry records results of a standard eye exam.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Eyes_log.json
--
CREATE TABLE [dbo].[Eyes log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL, 
	[right_eye_sphere_d] FLOAT NULL,
	[right_eye_cylinder] FLOAT NULL,
	[right_eye_axis] FLOAT NULL,
	[right_eye_prism_d] FLOAT NULL,
	[right_eye_add] FLOAT NULL,
	[left_eye_sphere_d] FLOAT NULL,
	[left_eye_cylinder] FLOAT NULL,
	[left_eye_axis] FLOAT NULL,
	[left_eye_prism_d] FLOAT NULL,
	[left_eye_add] FLOAT NULL,
	[pupillary_distance_mm] FLOAT NULL,
	[exam_results_url] NVARCHAR (512) NULL,
	[remarks] NVARCHAR(2056) NULL, 
	CONSTRAINT [PK_Eyes log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Eyes log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Eyes log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Eyes log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Eyes log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
