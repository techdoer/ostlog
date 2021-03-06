﻿--
-- Version: Each entry records a diet and corresponding food item over a period of time.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Diet_log.json
--
CREATE TABLE [dbo].[Diet log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[schedule_id] INT NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[status] NVARCHAR(20) NOT NULL,
	[diet_type] NVARCHAR (15) NOT NULL,
	[summary] NVARCHAR (512) NOT NULL,
	[food_item_id] INTEGER NULL,
	[was_successful] NVARCHAR(20) NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[side_effect_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR(4000) NULL,   

	CONSTRAINT [PK_Diet log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Diet log-Timing schedule] FOREIGN KEY ([schedule_id]) REFERENCES [dbo].[Timing schedule] ([id]),
	CONSTRAINT [FK_Diet log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Diet log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Diet log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([diet_type] = 'vegetarian' OR [diet_type] = 'dairy-free' OR [diet_type] = 'nut-free' OR [diet_type] = 'gluten-free' OR [diet_type] = 'vegan'  OR [diet_type] = 'halal'  OR [diet_type] = 'kosher'  OR [diet_type] = 'other'),
	CHECK ([status]='active' OR [status]='completed' OR [status]='entered-in-error' OR [status]='intended' OR [status]='stopped' OR [status]='on-hold' OR [status] = 'unknown' OR [status] = 'not-taken'),
	CHECK ([was_successful] = 'strongly disagree' OR [was_successful] = 'disagree' OR [was_successful] = 'neutral' OR [was_successful] = 'agree' OR [was_successful] = 'strongly agree')
)
