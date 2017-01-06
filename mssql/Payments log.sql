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

-- Version: A fact table to record payments credited/debited.  Designed for Azure SQL Server. 
-- URL:         -
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Payments log]
(
	[id] INT NOT NULL,
	[calendar_date_id] INT NOT NULL,
	[payer_id] INT NOT NULL,
	[payee_id] INT NULL,
	[payment_type] NVARCHAR(10) NOT NULL,
	[item_description] NVARCHAR(1000) NOT NULL, 
	[item_category] NVARCHAR(100) NOT NULL, 
	[amount_usd] FLOAT NOT NULL,
	[amount_euro] FLOAT NULL,
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK Payments log] PRIMARY KEY ([id]),
	CONSTRAINT [FK Payments log-Calendar dates] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK Payments log-People1] FOREIGN KEY ([payer_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK Payments log-People2] FOREIGN KEY ([payee_id]) REFERENCES [dbo].[People] ([id]),
	CHECK ([payment_type]='credit' OR [payment_type]='debit'),
	CHECK ([item_category]='arts' OR [item_category]='transport' OR [item_category]='xfer' OR [item_category]='bills' OR [item_category]='projects' OR [item_category]='cash' OR [item_category]='credit-payment' OR [item_category]='education' OR [item_category]='entertainment' OR [item_category]='fees' OR [item_category]='food' OR [item_category]='gifts' OR [item_category]='health' OR [item_category]='home' OR [item_category]='income' OR [item_category]='kids' OR [item_category]='loan' OR [item_category]='loan-payment' OR [item_category]='mortgage-rent' OR [item_category]='shopping' OR [item_category]='taxes' OR [item_category]='travel') 
)
