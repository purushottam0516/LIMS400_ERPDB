

	ALTER Table SAP_BASIC ADD RecordType NVARCHAR(10) DEFAULT '',
								InspectionLotOrigin NVARCHAR(10) DEFAULT '',
							  OperationNumber NVARCHAR(10) DEFAULT ''
								,InspStartDate DateTime2 Default ''
							  ,InspEndDate DateTime2 Default ''
							  ,InspectionLotDesc NVARCHAR(250) DEFAULT '',
							  BatchStorageLoc NVARCHAR(10) Default '',
							  PurchaseDocNum  NVARCHAR(50) Default '',
							  MaterialType    NVARCHAR(20) DEFAULT '',
							  DeliveryNote    NVARCHAR(20) DEFAULT '',
							  ParentBatchNo   NVARCHAR(25) DEFAULT '',
							  PackingSize     NVARCHAR(50) DEFAULT '',
							  IsReduceTestingLot tinyint DEFAULT 0,
							  IsSkipLot          tinyint Default 0