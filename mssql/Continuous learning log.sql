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

-- Version: Each entry records the a continuous learning activity.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Continuous_learning_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2018 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Continuous learning log]
(
	[id] INT NOT NULL,
	[meta_id] INT NULL,
	[start_date_id] INT NOT NULL,
	[start_time] TIME (0) NOT NULL,
	[end_date_id] INT NULL,
	[end_time] TIME (0) NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[name] NVARCHAR(100) NOT NUll,
	[type] NVARCHAR (10) NOT NULL,
	[status] NVARCHAR(20) NOT NULL,
	[is_successful] NVARCHAR(20) NULL,
	[remarks] NVARCHAR(4000) NULL,   

	CONSTRAINT [PK_Continuous learning log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Continuous learning log-Calendar_date2] FOREIGN KEY ([start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Continuous learning log-Calendar_date3] FOREIGN KEY ([end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Continuous learning log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Continuous learning log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	
	CHECK ([type] = 'reading' OR [type] = 'writing' OR [type] = 'listening' OR [type] = 'doing' OR [type] = 'hybrid'),
	CHECK ([status] = 'planned' OR [status] = 'in-progress' OR [status] = 'completed' OR [status] = 'cancelled'),
	CHECK ([is_successful] = 'strongly disagree' OR [is_successful] = 'disagree' OR [is_successful] = 'neutral' OR [is_successful] = 'agree' OR [is_successful] = 'strongly agree'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
)