USE [jjasek_a]
GO
/****** Object:  StoredProcedure [dbo].[IdentificatorsForEvent]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IdentificatorsForEvent]
	-- Add the parameters for the stored procedure here
	@EventID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT P.FirstName AS [First Name], P.LastName AS [Last Name], CC.CompanyName AS [Company Name]
	FROM Participant P
	JOIN ReservationListDetails RLD ON P.ParticipantID = RLD.ParticipantID
	JOIN ReservationList RL ON RLD.ReservationListID = RL.ReservationListID
	JOIN Reservation R ON R.ReservationID = RL.ReservationID
	JOIN CorporateCustomer CC ON CC.CustomerID = R.CustomerID
	WHERE RL.EventID = @EventID

	UNION

	SELECT P.FirstName, P.LastName, null
	FROM Participant P
	JOIN ReservationListDetails RLD ON P.ParticipantID = RLD.ParticipantID
	JOIN ReservationList RL ON RLD.ReservationListID = RL.ReservationListID
	JOIN Reservation R ON R.ReservationID = RL.ReservationID
	JOIN RetailCustomer RC ON RC.CustomerID = R.CustomerID
	WHERE RL.EventID = @EventID

END
GO
