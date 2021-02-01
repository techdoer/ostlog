--
-- Version: Each entry records a meal a person has eaten.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Nutrition_plant_based_rainbow_analyzer.json
--
CREATE TABLE [dbo].[Nutrition plant based rainbow analyzer]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME (0) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,
	[meal_type] NVARCHAR(10) NOT NULL,
	[blue_purple_score] INT NOT NULL,
	[green_score] INT NOT NULL,
	[orange_score] INT NOT NULL,
	[pale_green_white_score] INT NOT NULL,
	[red_score] INT NOT NULL,
	[yellow_green_score] INT NOT NULL,
	[remarks] NVARCHAR(4000) NULL,   
	CONSTRAINT [PK_Nutrition plant based rainbow analyzer] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Nutrition plant based rainbow analyzer-Calendar_date1] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Nutrition plant based rainbow analyzer-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Nutrition plant based rainbow analyzer-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Nutrition plant based rainbow analyzer-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CHECK ([meal_type] = 'breakfast' OR [meal_type] = 'lunch' OR [meal_type] = 'dinner' OR [meal_type] = 'snack'),
	CHECK ([blue_purple_score] between 1 and 3),
	CHECK ([green_score] between 1 and 3),
	CHECK ([orange_score] between 1 and 3),
	CHECK ([pale_green_white_score] between 1 and 3),
	CHECK ([red_score] between 1 and 3),
	CHECK ([yellow_green_score] between 1 and 3),
	)