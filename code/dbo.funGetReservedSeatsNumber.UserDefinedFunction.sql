USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funGetReservedSeatsNumber]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[funGetReservedSeatsNumber]
(
	-- Add the parameters for the function here
	@EventID BigInt
)
RETURNS BigInt
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ReservedSeats BigInt

	-- Add the T-SQL statements to compute the return value here
	SET @ReservedSeats = (SELECT ISNULL(SUM(RL.ReservedNormalSeats + RL.ReservedStudentSeats), 0) FROM ReservationList RL WHERE RL.EventID = @EventID)

	-- Return the result of the function
	RETURN @ReservedSeats

END
GO
