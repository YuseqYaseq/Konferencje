USE [jjasek_a]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[AddressID] [bigint] NOT NULL,
	[AvailableSeats] [bigint] NOT NULL,
 CONSTRAINT [PK_EVENT] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [Event_fk0] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [Event_fk0]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [CK_AvailableSeats] CHECK  (([AvailableSeats]>(0)))
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [CK_AvailableSeats]
GO
