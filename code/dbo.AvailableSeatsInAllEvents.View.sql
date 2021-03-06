USE [jjasek_a]
GO
/****** Object:  View [dbo].[AvailableSeatsInAllEvents]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AvailableSeatsInAllEvents] AS
SELECT E.EventID, E.AvailableSeats - ISNULL(SUM(RL.ReservedSeats), 0) AS AvailableSeats
FROM Event E
LEFT JOIN ReservationList RL ON RL.EventID = E.EventID
GROUP BY E.EventID, E.AvailableSeats
GO
