--
-- Version: Each entry records a journey/trip/vacation in time.  Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Travel_log.json
--
CREATE TABLE [dbo].[Travel log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[start_date_id] INT NOT NULL,
	[start_time] TIME (0) NOT NULL,
	[end_date_id] INT NOT NULL,
	[end_time] TIME (0) NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[departure_location_id] INT NULL,
	[destination_location_id] INT NULL,
	[length_in_nights] INT NOT NULL,
	[remarks] NVARCHAR(2056) NULL,   
	CONSTRAINT [PK_Travel log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Travel log-Calendar_date1] FOREIGN KEY ([start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Travel log-Calendar_date2] FOREIGN KEY ([end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Travel log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Travel log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Travel log-Location1] FOREIGN KEY ([departure_location_id]) REFERENCES [dbo].[Location] ([location_id]),
	CONSTRAINT [FK_Travel log-Location2] FOREIGN KEY ([destination_location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
