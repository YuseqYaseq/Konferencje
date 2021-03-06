USE [jjasek_a]
GO
/****** Object:  UserDefinedFunction [dbo].[liczbaDniWOkresie]    Script Date: 10.05.2018 10:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[liczbaDniWOkresie] (@okresp date, @okresk date, @pobytp date, @pobytk date)
RETURNS int
AS BEGIN
	DECLARE @retval int
	IF @pobytp BETWEEN @okresp AND @okresk
	BEGIN
		IF @pobytk BETWEEN @okresp AND @okresk
			SET @retval = DATEDIFF(d, @pobytp, @pobytk) + 1
		ELSE
			SET @retval = DATEDIFF(d, @pobytp, @okresk) + 1
	END
	ELSE IF @okresp BETWEEN @pobytp AND @pobytk
	BEGIN
		IF @okresk BETWEEN @pobytp AND @pobytk
			SET @retval = DATEDIFF(d, @okresp, @okresk) + 1
		ELSE
			SET @retval = DATEDIFF(d, @okresp, @pobytk) + 1
	END
	ELSE
		SET @retval = 0
	RETURN @retval
END
GO
