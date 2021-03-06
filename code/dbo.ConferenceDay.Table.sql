USE [jjasek_a]
GO
/****** Object:  Table [dbo].[ConferenceDay]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceDay](
	[EventID] [bigint] NOT NULL,
	[ConferenceID] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[StudentDiscount] [real] NULL,
 CONSTRAINT [PK_CONFERENCEDAY] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceDay]    Script Date: 10.05.2018 10:52:20 ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceDay] ON [dbo].[ConferenceDay]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConferenceDay]  WITH CHECK ADD  CONSTRAINT [ConferenceDay_fk0] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[ConferenceDay] CHECK CONSTRAINT [ConferenceDay_fk0]
GO
ALTER TABLE [dbo].[ConferenceDay]  WITH CHECK ADD  CONSTRAINT [ConferenceDay_fk1] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conference] ([ConferenceID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ConferenceDay] CHECK CONSTRAINT [ConferenceDay_fk1]
GO
ALTER TABLE [dbo].[ConferenceDay]  WITH CHECK ADD  CONSTRAINT [CK_ConferenceDay] CHECK  (([StudentDiscount]>=(0) AND [StudentDiscount]<=(1)))
GO
ALTER TABLE [dbo].[ConferenceDay] CHECK CONSTRAINT [CK_ConferenceDay]
GO
