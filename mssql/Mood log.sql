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

-- Version: Each entry records a person's assessment of their mood and a sentiment score on the response on a day in time.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Sleep_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Mood log]
(
	[id] INT NOT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME (0) NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[emotion_1] NVARCHAR (100) NULL,
	[emotion_2] NVARCHAR (100) NULL,
	[how_are_you_text] NVARCHAR(4000) NOT NULL,
	[how_are_you_score] FLOAT NULL,
	[remarks] NVARCHAR(4000) NULL,   
	CONSTRAINT [PK_Mood log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Mood log-Calendar_date1] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Mood log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental'),
	CHECK([emotion_1] = 'fear' OR [emotion_1] = 'anger' OR [emotion_1] = 'sadness' OR [emotion_1] = 'joy' OR [emotion_1] = 'disgust' OR [emotion_1] = 'surprise' OR [emotion_1] = 'trust' OR [emotion_1] = 'anticipation'),
	CHECK([emotion_2] = 'fear' OR [emotion_2] = 'anger' OR [emotion_2] = 'sadness' OR [emotion_2] = 'joy' OR [emotion_2] = 'disgust' OR [emotion_2] = 'surprise' OR [emotion_2] = 'trust' OR [emotion_2] = 'anticipation'),

)
