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

-- Version: Each entry references a standard growth measure.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Drug_targets.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2018 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Growth charts] (
	[months] FLOAT NOT NULL,
	[measure] NVARCHAR (20) NOT NULL,
	[gender] NVARCHAR (10) NOT NULL,
	[meta_id] INT NULL,
	[3rd] FLOAT NOT NULL,
	[5th] FLOAT NOT NULL,
	[10th] FLOAT NOT NULL,
	[25th] FLOAT NOT NULL,
	[50th] FLOAT NOT NULL,
	[75th] FLOAT NOT NULL,
	[90th] FLOAT NOT NULL,
	[95th] FLOAT NOT NULL,
	[97th] FLOAT NOT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Growth charts] PRIMARY KEY CLUSTERED ([months] ASC, [measure] ASC, [gender] ASC),
	CONSTRAINT [FK_Growth charts-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id])
)