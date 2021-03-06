USE [jjasek_a]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [bigint] IDENTITY(1,1) NOT NULL,
	[ReservationID] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Amount] [money] NOT NULL,
	[SenderName] [nvarchar](200) NOT NULL,
	[SenderAccountNumber] [nvarchar](100) NOT NULL,
	[ReceivedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [Payment_fk0] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservation] ([ReservationID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [Payment_fk0]
GO
