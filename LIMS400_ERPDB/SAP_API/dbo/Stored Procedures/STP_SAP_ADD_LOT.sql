

CREATE PROCEDURE [dbo].[STP_SAP_ADD_LOT]
    @MemoNumber NVARCHAR(50)='',
    @MemoDate DATETIME2='',
    @ItemDesc NVARCHAR(250)='',
    @ItemCode NVARCHAR(50)='',
    @ManufactureName NVARCHAR(250)='',
    @ManufactureCode NVARCHAR(50)='',
    @SupplierName NVARCHAR(250)='',
    @SupplierCode NVARCHAR(50)='',
    @BatchNo NVARCHAR(50)='',
    @BatchQuantity DECIMAL(18, 2)=0,
    @BatchUOM NVARCHAR(50)='',
    @BatchManufactureDate DATETIME2='',
    @ExpiryDate DATETIME2='',
    @RetestDate DATETIME2='',
	@EX_RT_Indicator NVARCHAR(250)='',
    @SampleNo NVARCHAR(50)='',
    @SampleQty DECIMAL(18, 2)=0,
    @SampleQtyUOM NVARCHAR(50)='',
    @SamplingBy NVARCHAR(250)='',
    @InspectionType NVARCHAR(50)='',
    @PlantCode NVARCHAR(50)='',
    @CreatedBy NVARCHAR(250)='',
    @CreatedOn DATETIME2='',
    @TotalNoOfContainers nvarchar(100),
    @VendorBatchNo NVARCHAR(50)='',
    @InspectionLot NVARCHAR(50)='',
    @GRNNo NVARCHAR(50)='',
    @GRNDate DATETIME2='',
    @GRNUOM NVARCHAR(50)='',
    @GRNQty DECIMAL(18, 2)=0,
    @DownloadedOn DATETIME2='',
	@InspReceiptID int=0,
	@IsModified int=0,
	@CustomerName NVARCHAR(50)='',
	@CustomerNo NVARCHAR(50)='',
	@VendorLotNo NVARCHAR(50)='',
	@NextInspInterval NVARCHAR(50)='',
	@RetestFlag int=0,
	@BatchStorageLoc NVARCHAR(10)='',
	@PurchaseDocNum NVARCHAR(50)='',
	@MaterialType NVARCHAR(20),
	@DeliveryNote NVARCHAR(20)='',
	@ParentBatchNo NVARCHAR(25)='',
	@PackingSize NVARCHAR(50)='',
	@IsReduceTestingLot tinyint=0,	
	@IsSkipLot tinyint=0,
	@InspectionLotDesc NVARCHAR(250)='',
	@InspEndDate DateTime2='',
	@InspStartDate DateTime2='',
	@OperationNumber NVARCHAR(10)='',
	@InspectionLotOrigin NVARCHAR(10)='',
	@RecordType NVARCHAR(10)='',
	@ReturnStatus int=0 output,
	@Keyfield Nvarchar(100)='' output

AS
BEGIN
	if @InspectionLot='' and @MemoNumber<>''
	begin
		Set @InspectionLot=@MemoNumber
	end
	BEGIN TRY
		IF NOT EXISTS(SELECT SapBasicID FROM SAP_BASIC WHERE InspectionLot=@InspectionLot)
		BEGIN
		print 1
			INSERT INTO SAP_BASIC (
        MemoNumber,
        MemoDate,
        ItemDesc,
        ItemCode,
        ManufactureName,
        ManufactureCode,
        SupplierName,
        SupplierCode,
        BatchNo,
        BatchQuantity,
        BatchUOM,
        ManufactureDate,
        ExpiryDate,
        RetestDate,
		ExpiryRetestIndicator,
        SampleNo,
        SampleQty,
        SampleQtyUOM,
        SamplingBy,
        InspectionType,
        PlantCode,
        CreatedBy,
        CreatedOn,
        TotalNoOfContainers,
        VendorBatchNo,
        InspectionLot,       
        GRNNo,
        GRNDate,
        GRNUOM,
        GRNQty,
        DownloadedOn,
		InspReceiptID,
		IsModified,
		CustomerName,
		CustomerCode,
		VendorLotNo,
		BatchStorageLoc,
		PurchaseDocNum,
		MaterialType,
		DeliveryNote,
		ParentBatchNo,
		PackingSize,
		IsReduceTestingLot,
		IsSkipLot,
		InspectionLotDesc,
		InspEndDate,
		InspectionLotOrigin,
		OperationNumber,
		RecordType
    )
    VALUES (	   
        @MemoNumber,
        @MemoDate,
        @ItemDesc,
        @ItemCode,
        @ManufactureName,
        @ManufactureCode,
        @SupplierName,
        @SupplierCode,
        @BatchNo,
        @BatchQuantity,
        @BatchUOM,
        @BatchManufactureDate,
        @ExpiryDate,
        @RetestDate,
		@EX_RT_Indicator,
        @SampleNo,
        @SampleQty,
        @SampleQtyUOM,
        @SamplingBy,
        @InspectionType,
        @PlantCode,
        @CreatedBy,
        @CreatedOn,
        @TotalNoOfContainers,
        @VendorBatchNo,       
        @InspectionLot,   
        @GRNNo,
        @GRNDate,
        @GRNUOM,
        @GRNQty,
        @DownloadedOn,
		@InspReceiptID,
		@IsModified,
		@CustomerName,
		@CustomerNo,
		@VendorLotNo,
		@BatchStorageLoc, 
		@PurchaseDocNum,  
		@MaterialType,    
		@DeliveryNote,    
		@ParentBatchNo,   
		@PackingSize, 
		@IsReduceTestingLot,
		@IsSkipLot,
		@InspectionLotDesc,
		@InspEndDate,
		@InspectionLotOrigin,
		@OperationNumber,
		@RecordType
    );

			Set @ReturnStatus=1
			set @Keyfield=@InspectionLot
		END
	ELSE if(@IsModified=1)
	BEGIN
	print 2
	UPDATE SAP_BASIC
SET
    MemoDate = @MemoDate,
    ItemDesc = @ItemDesc,
    ItemCode = @ItemCode,
    ManufactureName = @ManufactureName,
    ManufactureCode = @ManufactureCode,
    SupplierName = @SupplierName,
    SupplierCode = @SupplierCode,
    BatchNo = @BatchNo,
    BatchQuantity = @BatchQuantity,
    BatchUOM = @BatchUOM,
    ManufactureDate = @BatchManufactureDate,
    ExpiryDate = @ExpiryDate,
    RetestDate = @RetestDate,
    ExpiryRetestIndicator = @EX_RT_Indicator,
    SampleNo = @SampleNo,
    SampleQty = @SampleQty,
    SampleQtyUOM = @SampleQtyUOM,
    SamplingBy = @SamplingBy,
    InspectionType = @InspectionType,
    PlantCode = @PlantCode,
    CreatedBy = @CreatedBy,
    CreatedOn = @CreatedOn,
    TotalNoOfContainers = @TotalNoOfContainers,
    VendorBatchNo = @VendorBatchNo,
    InspectionLot = @InspectionLot,
    GRNNo = @GRNNo,
    GRNDate = @GRNDate,
    GRNUOM = @GRNUOM,
    GRNQty = @GRNQty,
    DownloadedOn = @DownloadedOn,
    InspReceiptID = @InspReceiptID,
    IsModified = @IsModified,
    CustomerName = @CustomerName,
    CustomerCode = @CustomerNo,
    VendorLotNo = @VendorLotNo,
	BatchStorageLoc=@BatchStorageLoc,
	PurchaseDocNum=@PurchaseDocNum,
	MaterialType=@MaterialType,
	DeliveryNote=@DeliveryNote,
	ParentBatchNo=@ParentBatchNo,
	PackingSize=@PackingSize,
	IsReduceTestingLot=@IsReduceTestingLot,
	IsSkipLot=@IsSkipLot,
	InspectionLotDesc=@InspectionLotDesc,
	InspEndDate =@InspEndDate ,
	OperationNumber=@OperationNumber,
	InspectionLotOrigin=@InspectionLotOrigin,
	RecordType=@RecordType
WHERE
    MemoNumber = @MemoNumber;  -- Assumes MemoNumber is the unique key

	Set @ReturnStatus=1
	set @Keyfield=@InspectionLot

	END
	ELSE IF(@IsModified=0)
       BEGIN
	   print 3
           SET @ReturnStatus = 0;
           SET @Keyfield = 'InspectionLot already exists';
       END
	END TRY
	BEGIN CATCH
		SET @ReturnStatus = -1;
        SET @Keyfield = ERROR_MESSAGE();
	END CATCH
 SELECT @ReturnStatus AS ReturnStatus, @Keyfield AS Keyfield;
END
