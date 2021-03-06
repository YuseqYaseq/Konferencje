USE [jjasek_a]
GO
/****** Object:  View [dbo].[ParticipantsAtEvents]    Script Date: 10.05.2018 10:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ParticipantsAtEvents] AS
		(SELECT E.EventID, P.FirstName, P.LastName, P.AddressID, P.PhoneNumber, P.EmailAddress
		FROM Event E
		LEFT JOIN ReservationList RL ON RL.EventID = E.EventID
		LEFT JOIN ReservationListDetails RLD ON RLD.ReservationListID = RL.ReservationListID
		LEFT JOIN Participant P ON P.ParticipantID = RLD.ParticipantID
		WHERE RLD.ParticipantID IS NOT NULL)
GO
