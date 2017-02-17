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

-- Version: A simple fact table to record school grades from primary school through to university. 
-- URL: 
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[School grades log]
(
	[id] INT NOT NULL,
	[start_calendar_date_id] INT NOT NULL,
	[end_calendar_date_id] INT NOT NULL,
	[person_id] INT NOT NULL,
	[instructor_id] INT NULL,
	[school_level_isced] INT NOT NULL, -- referencing International Standard Classification of Education ISCED 2011
	[subject_name] NVARCHAR (512) NOT NULL,
	[grade_point] INT NULL,
	[grade_desc] NVARCHAR (64) NULL, -- Excellent, Very Good, Good, Accepted, Failed
	[grade_point_minimum] INT NULL, -- maximum value supported by the grading system (e.g. 0)
	[grade_point_maximum] INT NULL, -- the minimum value supported by the grading system (e.g 10)
	[grade_letter] NVARCHAR(1) NULL, -- e.g. A=Excelent, B=Good, C=Average, D=Below Average, F=Failing
	[remarks] NVARCHAR(2056) NULL,   
	CONSTRAINT [PK_School grades log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_School grades log-Calendar_date1] FOREIGN KEY ([start_calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_School grades log-Calendar_date2] FOREIGN KEY ([end_calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_School grades log-People1] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_School grades log-People2] FOREIGN KEY ([instructor_id]) REFERENCES [dbo].[People] ([id]),
	CHECK ([school_level_isced] >= 0 AND [school_level_isced] <= 8),
	CHECK ([grade_desc] = 'excellent' OR [grade_desc] = 'very good' OR [grade_desc] = 'good' OR [grade_desc] = 'accepted' OR [grade_desc] = 'failed')
)
