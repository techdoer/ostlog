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

-- Version: Each entry provides metadata for a single entry of self-tracking data.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Meta_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2018 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Meta log]
(
	[id] INT NOT NULL,
	[version_id] INT NOT NULL,
	[last_updated] DATETIME NOT NULL,
	[mode_description] NVARCHAR (1000) NOT NULL,
	[collector_id] INT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Meta log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Meta log-People] FOREIGN KEY ([collector_id]) REFERENCES [dbo].[People] ([id]),
)
