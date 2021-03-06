USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funGetNumberOfDistinctReservedEvents]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[funGetNumberOfDistinctReservedEvents]
(
	-- Add the parameters for the function here
	@ReservationID BigInt
)
RETURNS BigInt
AS
BEGIN
	-- Declare the return variable here
	DECLARE @DistinctEvents BigInt

	-- Add the T-SQL statements to compute the return value here
	SELECT @DistinctEvents = (SELECT COUNT(RL.EventID) FROM dbo.ReservationList RL WHERE RL.ReservationID = @ReservationID)

	-- Return the result of the function
	RETURN @DistinctEvents

END
GO
