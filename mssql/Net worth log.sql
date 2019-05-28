--
-- Version:  Each entry records net worth on  day in time.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Net_worth_log.json
--
CREATE TABLE [dbo].[Net worth log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'financial' NOT NULL,
	[person_id] INT NOT NULL, 
	[cash_usd] INT NULL,
	[financial_investments_usd] INT NULL,
	[real_estate_investments_usd] INT NULL,
	[other_assets_usd] INT NULL,
	[loans_usd] INT NULL,
	[credit_card_usd] INT NULL,
	[other_liabilities_usd] INT NULL,
	[remarks] NVARCHAR(4000) NULL, 
	CONSTRAINT [PK_Net worth log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Net worth log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Net worth log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Net worth log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Net worth log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
