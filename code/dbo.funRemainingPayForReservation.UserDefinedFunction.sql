USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funRemainingPayForReservation]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[funRemainingPayForReservation](
	@ReservationID BigInt
)
RETURNS Money
AS BEGIN
	DECLARE @Return Money
	SET @Return = (SELECT CP.Amount
				FROM dbo.CustomersWithPayments CP
				WHERE CP.ReservationID = @ReservationID)
			
	RETURN ISNULL(@Return, 0)
END
GO
