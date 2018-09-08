--
-- This program is licensed to you under the MIT License
-- Copyright (c) 2017 family•smarts. All rights reserved.
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal 
-- in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
-- of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
-- FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-- Version: Each entry records a meal a person has eaten.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Meal_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2018 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Meal log]
(
	[id] INT NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME (0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[meal_type] NVARCHAR(10) NOT NULL,
	[duration_minutes] FLOAT NULL,
	[total_calories] FLOAT NULL,
	[meal_was_balanced] NVARCHAR (20) NULL,
	[meal_was_sufficient] NVARCHAR (20) NULL,
	[meal_was_nutritious] NVARCHAR (20) NULL,
	[remarks] NVARCHAR(4000) NULL,   
	CONSTRAINT [PK_Meal log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Meal log-Calendar_date1] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Meal log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Meal log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Meal log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CHECK ([meal_type] = 'breakfast' OR [meal_type] = 'lunch' OR [meal_type] = 'dinner' OR [meal_type] = 'snack'),
	CHECK ([meal_was_balanced] = 'strongly disagree' OR [meal_was_balanced] = 'disagree' OR [meal_was_balanced] = 'neutral' OR [meal_was_balanced] = 'agree' OR [meal_was_balanced] = 'strongly agree'),
	CHECK ([meal_was_sufficient] = 'strongly disagree' OR [meal_was_sufficient] = 'disagree' OR [meal_was_sufficient] = 'neutral' OR [meal_was_sufficient] = 'agree' OR [meal_was_sufficient] = 'strongly agree'),
	CHECK ([meal_was_nutritious] = 'strongly disagree' OR [meal_was_nutritious] = 'disagree' OR [meal_was_nutritious] = 'neutral' OR [meal_was_nutritious] = 'agree' OR [meal_was_nutritious] = 'strongly agree'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)