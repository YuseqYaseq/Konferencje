USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[RemoveEvent]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveEvent](
	@EventID bigint)
AS BEGIN
	IF EXISTS(SELECT * FROM Event E JOIN Workshop W ON W.EventID = E.EventID AND W.EventID=@EventID)
	BEGIN
		--Usuwanie Reservation List
		DECLARE @I bigint
		DECLARE cur CURSOR LOCAL FOR
			SELECT ReservationListID
			FROM ReservationList
			WHERE EventID = @EventID
		OPEN cur;
		FETCH NEXT FROM cur INTO @I;
		WHILE @@FETCH_STATUS=0
		BEGIN
			EXEC [dbo].RemoveReservationList @I
			FETCH NEXT FROM cur INTO @I;
		END
		CLOSE cur;
		DEALLOCATE cur;
		DELETE FROM Workshop WHERE Workshop.EventID = @EventID
		DELETE FROM Event WHERE Event.EventID = @EventID
	END
	ELSE
	BEGIN
		--Usuwanie ConferenceDayPrice
		DECLARE @I2 bigint
		DECLARE cur2 CURSOR LOCAL FOR
			SELECT PriceDateLimit
			FROM ConferenceDayPrice
			WHERE ConferenceDayID=@EventID
		OPEN cur2;
		FETCH NEXT FROM cur2 INTO @I2;
		WHILE @@FETCH_STATUS=0
		BEGIN
			EXEC [dbo].RemoveConferenceDayPrice @EventID, @I2
			FETCH NEXT FROM cur2 INTO @I2;
		END
		CLOSE cur2;
		DEALLOCATE cur2;

		--Usuwanie Workshop
		DECLARE cur3 CURSOR LOCAL FOR
			SELECT EventID
			FROM Workshop
			WHERE Workshop.ConferenceDayID = @EventID
		OPEN cur3;
		FETCH NEXT FROM cur3 INTO @I2;
		WHILE @@FETCH_STATUS=0
		BEGIN
			EXEC [dbo].RemoveEvent @I2
			FETCH NEXT FROM cur3 INTO @I2;
		END
		CLOSE cur3;
		DEALLOCATE cur3;

		--Usuwanie Reservation List
		DECLARE cur4 CURSOR LOCAL FOR
			SELECT ReservationListID
			FROM ReservationList
			WHERE EventID = @EventID
		OPEN cur4;
		FETCH NEXT FROM cur4 INTO @I2;
		WHILE @@FETCH_STATUS=0
		BEGIN
			EXEC [dbo].RemoveReservationList @I2
			FETCH NEXT FROM cur4 INTO @I2;
		END
		CLOSE cur4;
		DEALLOCATE cur4;
		DELETE FROM ConferenceDay WHERE ConferenceDay.EventID = @EventID
		DELETE FROM Event WHERE Event.EventID = @EventID
	END
END
GO
