

typedef NS_ENUM(NSInteger, DOWNLOADTYPE)
{
    //以下是枚举成员
    READY = 0,
    EXECUTING = 1,
    STOP = 2,
    PAUSE = 3,
    ENDTRANSFER=4
};

//enum taskTransferType
//{
//    
//    transfering=0,
//    ready,
//    pauseTransfer,
//    endTransfer
//};
@class BMDownloadFileInfo;
@interface BMDownloadManager : BMBaseAction
AS_SINGLETON(BMDownloadManager)



@property (nonatomic,strong) NSMutableDictionary *dicDownloadRequestOperation;

-(void)downloadFileInfoWithBaseParam:(BMBaseParam*)baseparam;
-(void)downloadFileWithBaseParam:(BMBaseParam*)baseparam;

-(void)startDownload:(BMDownloadFileInfo*)musicEntity;

-(void)pauseDownload:(BMDownloadFileInfo*)musicEntity;



-(void)deleteDownloadTask:(BMDownloadFileInfo*)downloadfileinfo withDeleteFile:(BOOL)isDelete;

-(void)deleteDownloadTask:(BMDownloadFileInfo*)downloadfileinfo;

-(void)deleteQueueTask:(id)task;

@property (readwrite) NSInteger intDownloadThreadCount;

@end

#define SharedBMDownloadManager   ([BMDownloadManager sharedInstance])