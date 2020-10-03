--
-- Version: Each entry records a health event observed on a day in time.   Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Health_log.json
--
CREATE TABLE [dbo].[Health log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[observation_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[observation_time] TIME(0) NOT NULL, /* HH:MM:SS */
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[body_site_code] INT NULL,
	[diagnosis_id] INT NULL,
	[event_id] INT NOT NULL, /* foreign key from standard Symptoms table included in this kit */
	[event_icd10_code] NVARCHAR(10), /* the WHO's ICD-10 code for this event */
	[occurance] INT NULL, /* 1 = first, 2= recurring; 3 = last */
	[remarks] NVARCHAR(4000) NULL, 
	CONSTRAINT [PK_Health log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Health log-Calendar_date] FOREIGN KEY ([observation_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Health log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Health log-Symptom] FOREIGN KEY ([event_id]) REFERENCES [dbo].[Symptoms] ([id]),
	CONSTRAINT [FK_Health log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Health log-Diagnosis log] FOREIGN KEY ([diagnosis_id]) REFERENCES [dbo].[Diagnosis log] ([id]),
	CONSTRAINT [FK_Health log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id])
)