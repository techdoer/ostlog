--
-- Version: Each entry records a credit/debit transaction.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Payments_log.json
--
CREATE TABLE [dbo].[Payments log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NULL,
	[location_id] INT NULL, 
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
	CONSTRAINT [FK_Payments log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),

	CHECK ([payment_type]='credit' OR [payment_type]='debit'),
	CHECK ([item_category]='arts' OR [item_category]='transport' OR [item_category]='xfer' OR [item_category]='bills' OR [item_category]='projects' OR [item_category]='cash' OR [item_category]='credit-payment' OR [item_category]='education' OR [item_category]='entertainment' OR [item_category]='fees' OR [item_category]='food' OR [item_category]='gifts' OR [item_category]='health' OR [item_category]='home' OR [item_category]='income' OR [item_category]='kids' OR [item_category]='loan' OR [item_category]='loan-payment' OR [item_category]='mortgage-rent' OR [item_category]='shopping' OR [item_category]='taxes' OR [item_category]='travel')
)
