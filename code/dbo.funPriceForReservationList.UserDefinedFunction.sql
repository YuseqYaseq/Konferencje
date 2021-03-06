USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[funPriceForReservationList]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[funPriceForReservationList] (@RLID bigint)
RETURNS money
AS BEGIN
	DECLARE @ret money
	IF EXISTS (SELECT * FROM Workshop W2 INNER JOIN ReservationList RL2 ON
				W2.EventID = RL2.ReservationListID WHERE RL2.ReservationListID = @RLID)
	BEGIN
		SET @ret = (SELECT (RL.ReservedNormalSeats+RL.ReservedStudentSeats)*W.Price AS MoneyToPay
					FROM ReservationList RL
					INNER JOIN Workshop W ON W.EventID = RL.EventID
					WHERE RL.ReservationListID = @RLID)
	END
	ELSE
	BEGIN
		DECLARE @date date
		SET @date = (SELECT Reservation.PurchaseDate FROM ReservationList JOIN Reservation
					ON Reservation.ReservationID = ReservationList.ReservationID
					WHERE ReservationList.ReservationListID = @RLID)
		
		DECLARE @price money
		SET @price = dbo.funPriceForConferenceDayFromDateOfReservation(@RLID, @date)
		SET @ret = (SELECT (RL.ReservedNormalSeats * @price) + (RL.ReservedStudentSeats * @price * (1-CD.StudentDiscount))
					FROM ReservationList RL
					INNER JOIN ConferenceDay CD ON CD.EventID = RL.EventID
					WHERE RL.EventID = @RLID)
	END
	RETURN @ret
END
GO
