--
-- URL: https://github.com/techdoer/ostlog/blob/master/schema/Story_log.json
--
CREATE TABLE [dbo].[Story log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[start_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[start_time] TIME(0) NOT NULL,
	[end_date_id] INT NULL, 
	[end_time] TIME(0) NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL, 
	[title] NVARCHAR (512) NULL,
	[text_summary] NVARCHAR(4000) NULL, 
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Story log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Story log-Calendar_date] FOREIGN KEY ([start_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Story log-Calendar_date1] FOREIGN KEY ([end_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Story log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Story log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Story log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
