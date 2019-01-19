--
-- This program is licensed to you under the MIT License
-- Copyright (c) 2018 family•smarts. All rights reserved.
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal 
-- in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
-- of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
-- FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-- Version: Each entry records a diet and corresponding food item over a period of time.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Diet_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2019 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Diet log]
(
	[id] INT NOT NULL,
	[meta_id] INT NULL,
	[start_date_id] INT NOT NULL,
	[start_time] TIME (0) NOT NULL,
	[end_date_id] INT NULL,
	[end_time] TIME (0) NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[status] NVARCHAR(20) NOT NULL,
	[diet_type] NVARCHAR (15) NOT NULL,
	[food_item_id] INTEGER NOT NULL,
	[was_successful] NVARCHAR(20) NULL,
	[effectivness_remarks] NVARCHAR (2048) NULL,
	[side_effect_remarks] NVARCHAR (2048) NULL,
	[remarks] NVARCHAR(4000) NULL,   

	CONSTRAINT [PK_Diet log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Diet log-Calendar_date2] FOREIGN KEY ([start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Diet log-Calendar_date3] FOREIGN KEY ([end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Diet log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Diet log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Diet log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([diet_type] = '"vegetarian"' OR [diet_type] = 'dairy-free' OR [diet_type] = 'nut-free' OR [diet_type] = 'gluten-free' OR [diet_type] = 'vegan'  OR [diet_type] = 'halal'  OR [diet_type] = 'kosher'  OR [diet_type] = 'other'),
	CHECK ([status] = 'planned' OR [status] = 'in-progress' OR [status] = 'completed' OR [status] = 'cancelled'),
	CHECK ([was_successful] = 'strongly disagree' OR [was_successful] = 'disagree' OR [was_successful] = 'neutral' OR [was_successful] = 'agree' OR [was_successful] = 'strongly agree'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)