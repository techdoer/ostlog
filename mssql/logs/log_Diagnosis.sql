--
-- Version: Each entry charaterizes a diagnosis given by a medical professional. Supports for Azure SQL Server. 
-- URL: http://ostlog.org/schema/Diagnosis_log.json
--
CREATE TABLE [dbo].[log_Diagnosis]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[location_id] INT NULL,
	[patient_id] INT NOT NULL,
	[body_site_code] INT NULL,
	[diagnosis_icd10_code] NVARCHAR(10) NOT NULL, /* from the WHO's International Statistical Classification of Diseases and Related Health Problems. */
	[num_days_with_symptoms] INT NULL,
	[remarks]	NVARCHAR (2056) NULL,
	CONSTRAINT [PK_log_Diagnosis] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_log_Diagnosis-Calendar_dates] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_log_Diagnosis-People] FOREIGN KEY ([patient_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_log_Diagnosis-Locations] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id])
)
