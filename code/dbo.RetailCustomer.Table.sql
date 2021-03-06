USE [jjasek_a]
GO
/****** Object:  Table [dbo].[RetailCustomer]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetailCustomer](
	[CustomerID] [bigint] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RetailCustomer]    Script Date: 10.05.2018 10:52:20 ******/
CREATE NONCLUSTERED INDEX [IX_RetailCustomer] ON [dbo].[RetailCustomer]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RetailCustomer]  WITH CHECK ADD  CONSTRAINT [RetailCustomer_fk0] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RetailCustomer] CHECK CONSTRAINT [RetailCustomer_fk0]
GO
