--
-- URL: https://github.com/techdoer/ostlog/blob/master/schema/log_Medical_procedure.json
--
CREATE TABLE [dbo].[log_Medical_procedure]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[schedule_id] INT NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[body_site_code] INT NULL,
	[procedure_name] NVARCHAR(100) NOT NULL,
	[procedure_sctid] BIGINT NOT NULL, -- SNOWMED CT ID referencing a procedure
	[procedure_results_url] NVARCHAR(512) NULL,
	[procedure_results_notes] NVARCHAR(2056) NULL,
	[was_effective] NVARCHAR (20) NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[side_effect_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR(2056) NULL,   
	CONSTRAINT [PK_log_Medical_procedure] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_log_Medical_procedure-Timing schedules] FOREIGN KEY ([schedule_id]) REFERENCES [dbo].[Timing schedules] ([id]),
	CONSTRAINT [FK_log_Medical_procedure-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_log_Medical_procedure-Locations] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id]),
	CHECK ([was_effective] = 'strongly disagree' OR [was_effective] = 'disagree' OR [was_effective] = 'neutral' OR [was_effective] = 'agree' OR [was_effective] = 'strongly agree')
)
