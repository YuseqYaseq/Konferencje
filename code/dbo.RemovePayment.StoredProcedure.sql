USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[RemovePayment]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemovePayment](
	@PaymentID bigint)
AS BEGIN
	DELETE FROM Payment WHERE PaymentID = @PaymentID
END
GO
