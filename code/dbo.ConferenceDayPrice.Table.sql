USE [jjasek_a]
GO
/****** Object:  Table [dbo].[ConferenceDayPrice]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConferenceDayPrice](
	[ConferenceDayID] [bigint] NOT NULL,
	[PriceDateLimit] [date] NOT NULL,
	[Price] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConferenceDayPrice]    Script Date: 10.05.2018 10:52:20 ******/
CREATE NONCLUSTERED INDEX [IX_ConferenceDayPrice] ON [dbo].[ConferenceDayPrice]
(
	[ConferenceDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ConferenceDayPrice]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceDayPrice] FOREIGN KEY([ConferenceDayID])
REFERENCES [dbo].[ConferenceDay] ([EventID])
GO
ALTER TABLE [dbo].[ConferenceDayPrice] CHECK CONSTRAINT [FK_ConferenceDayPrice]
GO
ALTER TABLE [dbo].[ConferenceDayPrice]  WITH CHECK ADD  CONSTRAINT [CK_ConferenceDayPrice] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[ConferenceDayPrice] CHECK CONSTRAINT [CK_ConferenceDayPrice]
GO
