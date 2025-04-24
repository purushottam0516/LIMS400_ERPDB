
create PROCEDURE [dbo].[STP_SAP_GET_USERS]	
AS
BEGIN
	Declare @USerId NVARCHAR(150)='',
			@PAssword NVARCHAR(150)=''

	SET @USerId='LIMS001'
	SET @PAssword='WEhAMDI1Q0JS'--XH@025CBR

	Select @USerId "UserID",@PAssword "Passsword"
END
