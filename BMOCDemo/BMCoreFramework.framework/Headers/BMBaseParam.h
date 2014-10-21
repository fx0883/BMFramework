/*!
 @header  BMBaseParam头文件
 @abstract
 @discussion ...
 */
#import <Foundation/Foundation.h>

/*!
 *  定义参数类的block
 *
 *  @param int       错误代码 如果错误代码为 0 就是正确的
 *  @param NSString 提示消息
 */
typedef void (^BaseBlock)(int,NSString*);

typedef void (^WithResultObjectBlock)(int,NSString*,id);

/*!
 *  调用Action的传入参数
 */
@interface BMBaseParam : NSObject

/*!
 *  array 参数
 */
@property (nonatomic,strong) NSMutableArray* paramArray;

/*!
 *  dictionary 参数
 */
@property (nonatomic,strong) NSMutableDictionary* paramDic;

/*!
 *  string 参数
 */
@property (nonatomic,strong) NSString* paramString;

/*!
 *  object 参数
 */
@property (nonatomic,strong) NSObject* paramObject;

/*!
 *  int 参数
 */
@property (nonatomic,strong) NSObject* paramInt;

/*!
 *  Bool 参数
 */
@property (readwrite) BOOL paramBool;


/*!
 *  方法调用完成
 */
@property (readwrite) BOOL isFinished;

/*!
 *  block 参数
 */
@property (nonatomic,strong) BaseBlock baseblock;
/*!
 *  block 参数
 */
@property (nonatomic,strong) WithResultObjectBlock withresultobjectblock;


/*!
 *  12312
 */
-(void)testFunc;
    
    

@end
