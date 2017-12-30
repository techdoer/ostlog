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

-- Version: Each entry records results of a standard eye exam.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Eyes_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Eyes log]
(
	[id] INT NOT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL, 
	[right_eye_sphere_d] FLOAT NULL,
	[right_eye_cylinder] FLOAT NULL,
	[right_eye_axis] FLOAT NULL,
	[right_eye_prism_d] FLOAT NULL,
	[right_eye_add] FLOAT NULL,
	[left_eye_sphere_d] FLOAT NULL,
	[left_eye_cylinder] FLOAT NULL,
	[left_eye_axis] FLOAT NULL,
	[left_eye_prism_d] FLOAT NULL,
	[left_eye_add] FLOAT NULL,
	[pupillary_distance_mm] FLOAT NULL,
	[exam_results_url] NVARCHAR (512) NULL,
	[remarks] NVARCHAR(2056) NULL, 
	CONSTRAINT [PK_Eyes log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Eyes log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Eyes log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
