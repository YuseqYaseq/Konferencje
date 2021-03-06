USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[tabFunGetParticipantsList]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[tabFunGetParticipantsList]
(	
	-- Add the parameters for the function here
	@EventID BigInt
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT RLD.ParticipantID
	FROM ReservationListDetails RLD
	JOIN ReservationList RL ON RL.ReservationListID = RLD.ReservationListID
	WHERE RL.EventID = @EventID
)
GO
