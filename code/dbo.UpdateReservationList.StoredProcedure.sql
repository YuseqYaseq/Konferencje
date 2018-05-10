USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[UpdateReservationList]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReservationList](
	@ReservationListID bigint,
	@ParticipantID	bigint,
	@ReservationType nvarchar(50))
AS BEGIN
	INSERT INTO ReservationListDetails VALUES (@ReservationListID, @ParticipantID, @ReservationType)
END
GO
