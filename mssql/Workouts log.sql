﻿--
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

-- Version: Each entry ecords a workout activity.  Supports Azure SQL Server. 
-- URL:  http://ostlog.org/schema/Workouts_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Workouts log]
(
	[id] INT NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT NOT NULL,
	[start_time] TIME(0) NULL, 
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL, 
	[workout_type] NVARCHAR(20) NOT NULL, 
	[duration_minutes] FLOAT NULL, 
	[distance_miles] FLOAT NULL, 
	[elevation_gain_ft] FLOAT NULL, 
	[avg_speed_mph] FLOAT NULL, 
	[max_speed_mph] FLOAT NULL, 
	[calories_burned] FLOAT NULL, 
	[steps] INT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Workouts log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Workouts log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Workouts log-Person] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Workouts log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),

	CHECK ([workout_type]='walking' OR [workout_type]='running' OR [workout_type]='swimming' OR [workout_type]='cycling' OR [workout_type]='hiking' OR [workout_type]='gymnastics' OR [workout_type]='dance' OR [workout_type]='other'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)