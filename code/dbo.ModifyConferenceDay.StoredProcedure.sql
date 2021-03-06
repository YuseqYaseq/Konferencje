USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[ModifyConferenceDay]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyConferenceDay](
	@CDayID bigint,
	@Title nvarchar(255),
	@Description nvarchar(1000),
	@AddressID bigint,
	@AvailableSeats bigint,
	@Discount real)
AS BEGIN
	UPDATE Event
	SET Title = @Title,
	Description = @Description,
	AddressID = @AddressID,
	AvailableSeats = @AvailableSeats
	WHERE Event.EventID = @CDayID
	UPDATE ConferenceDay
	SET StudentDiscount = @Discount
	WHERE ConferenceDay.EventID = @CDayID
END
GO
