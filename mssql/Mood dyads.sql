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

-- Version: a dyad is a combination of any two emotions. Based on Robert Plutchik's theory of the 8 basic emotions. Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Drug_targets.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2018 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Mood dyads]
(
	[name] NVARCHAR(50) NOT NULL,
	[emotion_member_1] NVARCHAR (100) NOT NULL,
	[emotion_member_2] NVARCHAR (100) NOT NULL,
	[level] INT NOT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Mood dyads] PRIMARY KEY CLUSTERED ([name] ASC),
	CHECK([emotion_member_1] = 'fear' OR [emotion_member_1] = 'anger' OR [emotion_member_1] = 'sadness' OR [emotion_member_1] = 'joy' OR [emotion_member_1] = 'disgust' OR [emotion_member_1] = 'surprise' OR [emotion_member_1] = 'trust' OR [emotion_member_1] = 'anticipation'),
	CHECK([emotion_member_2] = 'fear' OR [emotion_member_2] = 'anger' OR [emotion_member_2] = 'sadness' OR [emotion_member_2] = 'joy' OR [emotion_member_2] = 'disgust' OR [emotion_member_2] = 'surprise' OR [emotion_member_2] = 'trust' OR [emotion_member_2] = 'anticipation')

)
