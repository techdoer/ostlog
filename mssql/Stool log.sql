--
-- Version: Each entry records stool exam results.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Stool_log.json
--
CREATE TABLE [dbo].[Stool log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'physical' NOT NULL,
	[person_id] INT NOT NULL, 
	[bss_type] INT NULL, -- Bristol Stool Chart classification
	[color] NVARCHAR (10) NULL,
	[amount] NVARCHAR (10) NULL,
	[photo_url] NVARCHAR (512) NULL,
	[ph] INT NULL, -- 0..7..14
	[occult_blood] BIT NULL,
	[red_blood_cells] BIT NULL,
	[white_blood_cells] BIT NULL,
	[mucus] BIT NULL,
	[lysozyme_ng_ml] INT NULL,
	[calprotectin_ug_g] INT NULL,
	[lactoferrin_ug_ml] INT NULL,
	[carbohydrates] BIT NULL,
	[veg_fibers] BIT NULL,
	[muscle_fibers] BIT NULL,
	[fat_stain] BIT NULL,
	[elastase_ug_ml] BIT NULL,
	[secretory_iga_mg_dl] INT NULL,
	[remarks] NVARCHAR(2056) NULL, 
	CONSTRAINT [PK_Stool log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Stool log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Stool log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Stool log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Stool log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([bss_type] >= 1 AND [bss_type] <= 7), -- see https://en.wikipedia.org/wiki/Bristol_stool_scale
	CHECK ([amount] = 'little' OR [amount] = 'normal' OR [amount] = 'alot'),
	CHECK ([color] = 'brown' OR [color] = 'green' OR [color] = 'yellow' OR [color] = 'black' OR [color] = 'white' OR [color] = 'red'),
	CHECK ([ph] >= 1 AND [ph] <= 14),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
