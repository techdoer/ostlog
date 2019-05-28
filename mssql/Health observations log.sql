--
-- Version: Each entry records a health event observed on a day in time.   Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Health_observations_log.json
--
CREATE TABLE [dbo].[Health observations log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[observation_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[observation_time] TIME(0) NOT NULL, /* HH:MM:SS */
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL,
	[body_site_code] INT NULL,
	[diagnosis_id] INT NULL,
	[event_id] INT NOT NULL, /* foreign key from standard Symptoms table included in this kit */
	[event_icd10_code] NVARCHAR(10), /* the WHO's ICD-10 code for this event */
	[occurance] INT NULL, /* 1 = first, 2= recurring; 3 = last */
	[remarks] NVARCHAR(4000) NULL, 
	CONSTRAINT [PK_Health observations log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Health observations log-Calendar_date] FOREIGN KEY ([observation_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Health observations log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Health observations log-Symptom] FOREIGN KEY ([event_id]) REFERENCES [dbo].[Symptoms] ([id]),
	CONSTRAINT [FK_Health observations log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Health observations log-Diagnosis log] FOREIGN KEY ([diagnosis_id]) REFERENCES [dbo].[Diagnosis log] ([id]),
	CONSTRAINT [FK_Health observations log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)