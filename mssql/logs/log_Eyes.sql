--
-- Version: Each entry records results of a standard eye exam.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/log_Eyes.json
--
CREATE TABLE [dbo].[log_Eyes]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
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
	CONSTRAINT [PK_log_Eyes] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_log_Eyes-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_log_Eyes-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_log_Eyes-Locations] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id])
)
