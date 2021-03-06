USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funGetNumOfVacantSeats]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[funGetNumOfVacantSeats] 
(
	@EventID BigInt
)
RETURNS int
AS
BEGIN
	DECLARE @retval BigInt;
	SET @retval = (
		SELECT E.AvailableSeats - SUM(ISNULL(RL.ReservedNormalSeats, 0) + ISNULL(RL.ReservedStudentSeats, 0))
		FROM Event E
		LEFT JOIN ReservationList RL ON E.EventID = RL.EventID
		WHERE E.EventID = @EventID
		GROUP BY E.AvailableSeats);
	RETURN @retval
END
GO
