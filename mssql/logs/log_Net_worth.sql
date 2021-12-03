--
-- Version:  Each entry records net worth on  day in time.  Supports Azure SQL Server. 
-- URL: http://ostlog.org/schema/Net_worth_log.json
--
CREATE TABLE [dbo].[log_Net_worth]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL, 
	[cash_usd] INT NULL,
	[financial_investments_usd] INT NULL,
	[real_estate_investments_usd] INT NULL,
	[pension_lump_sum_equivalent_usd] INT NULL,
	[other_assets_usd] INT NULL,
	[loans_usd] INT NULL,
	[credit_card_usd] INT NULL,
	[other_liabilities_usd] INT NULL,
	[remarks] NVARCHAR(4000) NULL, 
	CONSTRAINT [PK_Net worth log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Net worth log-Calendar_dates] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Net worth log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Net worth log-Locations] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id])
)
