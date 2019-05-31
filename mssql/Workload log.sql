--
-- Version: Each entry records a person's level of workload at a point in time. Derives from NASA's task load index (TLX) Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Workload_log.json
--
CREATE TABLE [dbo].[Workload log]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[meta_id] INT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[domain] NVARCHAR (15) DEFAULT 'intellectual' NOT NULL,
	[person_id] INT NOT NULL,
	[work_is_mentally_demanding] NVARCHAR (20) NULL,
	[work_is_physically_demanding] NVARCHAR (20) NULL,
	[work_is_hurried_or_rushed] NVARCHAR (20) NULL,
	[work_is_meeting_expectations] NVARCHAR (20) NULL,
	[hard_work_is_required_to_meet_performance_level] NVARCHAR (20) NULL,
	[work_is_causing_insecurity_irritation_or_stress] NVARCHAR (20) NULL,
	[direct_reports] INT NOT NULL,
	[emails_received_last_week] INT NULL,
	[emails_sent_last_week] INT NULL,
	[meetings_attended_last_week] INT NULL,
	[hours_worked_last_week] FLOAT NULL,
	[remarks] NVARCHAR (4000) NULL,
	CONSTRAINT [PK_Workloag log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Workload log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Workload log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CONSTRAINT [FK_Workload log-Meta log] FOREIGN KEY ([meta_id]) REFERENCES [dbo].[Meta log] ([id]),
	CONSTRAINT [FK_Workload log-Location] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Location] ([location_id]),

	CHECK ([work_is_mentally_demanding] = 'strongly disagree' OR [work_is_mentally_demanding] = 'disagree' OR [work_is_mentally_demanding] = 'neutral' OR [work_is_mentally_demanding] = 'agree' OR [work_is_mentally_demanding] = 'strongly agree'),
	CHECK ([work_is_physically_demanding] = 'strongly disagree' OR[work_is_physically_demanding] = 'disagree' OR[work_is_physically_demanding] = 'neutral' OR [work_is_physically_demanding] = 'agree' OR [work_is_physically_demanding] = 'strongly agree'),
	CHECK ([work_is_hurried_or_rushed] = 'strongly disagree' OR[work_is_hurried_or_rushed] = 'disagree' OR [work_is_hurried_or_rushed] = 'neutral' OR [work_is_hurried_or_rushed] = 'agree' OR [work_is_hurried_or_rushed] = 'strongly agree'),
	CHECK ([work_is_meeting_expectations] = 'strongly disagree' OR [work_is_meeting_expectations] = 'disagree' OR [work_is_meeting_expectations] = 'neutral' OR [work_is_meeting_expectations] = 'agree' OR [work_is_meeting_expectations] = 'strongly agree'),
	CHECK ([hard_work_is_required_to_meet_performance_level] = 'strongly disagree' OR [hard_work_is_required_to_meet_performance_level] = 'disagree' OR [hard_work_is_required_to_meet_performance_level] = 'neutral' OR [hard_work_is_required_to_meet_performance_level] = 'agree' OR [hard_work_is_required_to_meet_performance_level] = 'strongly agree'),
	CHECK ([work_is_causing_insecurity_irritation_or_stress] = 'strongly disagree' OR [work_is_causing_insecurity_irritation_or_stress] = 'disagree' OR [work_is_causing_insecurity_irritation_or_stress] = 'neutral' OR [work_is_causing_insecurity_irritation_or_stress] = 'agree' OR [work_is_causing_insecurity_irritation_or_stress] = 'strongly agree'),

	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
