

CREATE PROCEDURE [dbo].[STP_ERP_LOT_REQ_JSON](
		@InspectionLotNum NVARCHAR(50)='',
		@ReqJson NVARCHAR(max)='',
		@DownloadedOn Datetime2,
		@ErrorMsg NVARCHAR(250)='',
		@TransType int=0
)
AS 
BEGIN
	IF @TransType=1 ----New lot download request
		BEGIN
			INSERT INTO LOT_Req_Json(InspectionLotNum
									,ReqJson
									,DownloadedOn)
						VALUES(@InspectionLotNum,@ReqJson,@DownloadedOn)
		END
	ELSE IF @TransType=2 ---while failed to saving lot in db to update error message
		BEGIN
			UPDATE LOT_Req_Json set ErrorMsg=@ErrorMsg where InspectionLotNum=@InspectionLotNum;
		END
	ELSE IF @TransType=3-----if Lot successfully saved in db deleting Json data of Lot.
		BEGIN
			DELETE FROM LOT_Req_Json WHERE InspectionLotNum=@InspectionLotNum; 
		END
END
