USE [KPI]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[usp_UserInfo]
		@refNumber = 'ce3683fd-0014-41f9-b733-330e3687ee60'

SELECT	@return_value as 'Return Value'

GO
