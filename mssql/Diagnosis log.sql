--
-- Version: Each entry charaterizes a diagnosis given by a medical professional. Supports for Azure SQL Server. 
-- URL: http://ostlog.org/schema/Diagnosis_log.json
--
CREATE TABLE [dbo].[Diagnosis log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[medical_visit_id] INT NULL,
	[patient_id] INT NOT NULL,
	[body_site_code] INT NULL,
	[diagnosis_icd10_code] NVARCHAR(10) NOT NULL, /* from the WHO's International Statistical Classification of Diseases and Related Health Problems. */
	[num_days_with_symptoms] INT NULL,
	[remarks]	NVARCHAR (2056) NULL,
	CONSTRAINT [PK_Diagnosis log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Diagnosis log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Diagnosis log-People] FOREIGN KEY ([patient_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Diagnosis log-Doctors log] FOREIGN KEY ([medical_visit_id]) REFERENCES [dbo].[Doctors log] ([id]),
	CONSTRAINT [FK_Diagnosis log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Diagnosis log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
