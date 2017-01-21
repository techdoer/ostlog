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

-- Version: A simple fact table to record urine test results.  Designed for Azure SQL Server. 
-- URL: 
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Urine log]
(
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[person_id] INT NOT NULL,
	[clarity] NVARCHAR(25) NULL, 
	[color]  NVARCHAR(25) NULL, 
	[density_15_c] FLOAT NULL,
	[ph] FLOAT NULL,
	[albumin] FLOAT NULL,
	[glucose] FLOAT NULL,
	[ketones] FLOAT NULL,
	[urobilinogen] FLOAT NULL,
	[bilirubin] FLOAT NULL,
	[hemoglobin] FLOAT NULL,
	[nitries] FLOAT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Urine log] PRIMARY KEY CLUSTERED ([calendar_date_id] ASC, [person_id] ASC),
	CONSTRAINT [FK_Urine log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Urine log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
)
