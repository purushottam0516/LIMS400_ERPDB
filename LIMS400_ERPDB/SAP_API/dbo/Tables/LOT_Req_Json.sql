CREATE TABLE [dbo].[LOT_Req_Json] (
    [ReqId]            INT            IDENTITY (1, 1) NOT NULL,
    [InspectionLotNum] NVARCHAR (50)  NOT NULL,
    [ReqJson]          NVARCHAR (MAX) NOT NULL,
    [DownloadedOn]     DATETIME2 (7)  CONSTRAINT [DF__LOT_Req_J__Downl__34C8D9D1] DEFAULT ('01/01/200') NOT NULL,
    [ErrorMsg]         NVARCHAR (250) CONSTRAINT [DF__LOT_Req_J__Error__35BCFE0A] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK__LOT_Req___28A9A3826BDE859F] PRIMARY KEY CLUSTERED ([ReqId] ASC)
);

