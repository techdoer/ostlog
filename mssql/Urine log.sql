--
-- Version: Each entry records results from a urine examination.  Supports Azure SQL Server. 
-- URL:  http://ostlog.org/schema/Urine_log.json
--
CREATE TABLE [dbo].[Urine log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[clarity] NVARCHAR(25) NULL, 
	[color]  NVARCHAR(25) NULL, 
	[density_15_c] FLOAT NULL,
	[ph] FLOAT NULL,
	[albumin] FLOAT NULL,
	[glucose] FLOAT NULL,
	[ketones] FLOAT NULL,
	[urobilinogen] FLOAT NULL,
	[bilirubin] FLOAT NULL,
	[hemoglobin] FLOAT NULL,
	[nitries] FLOAT NULL,
	[culture__cfu_ml] FLOAT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Urine log] PRIMARY KEY CLUSTERED ([calendar_date_id] ASC, [person_id] ASC),
	CONSTRAINT [FK_Urine log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Urine log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Urine log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Urine log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([ph] >= 1 AND [ph] <= 14)
)
