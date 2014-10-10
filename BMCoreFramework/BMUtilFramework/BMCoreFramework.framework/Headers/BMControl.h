#import <Foundation/Foundation.h>

/**
 *  调用Action的方式
 */
typedef enum
{
    INVOKEACTIONTYPE0,
    INVOKEACTIONTYPE1,
    INVOKEACTIONTYPE2,
    INVOKEACTIONTYPE3
} INVOKEACTIONTYPE;


/**
 *  @brief 主要控制器类
 */
@interface BMControl : NSObject
/**
 *  @brief 单例宏的调用
 */
AS_SINGLETON(BMControl)


/**
 *  @brief 调用Action的入口方法
 *
 *  @param dicparam dic封装参数
 */
-(void)excute:(NSMutableDictionary*)dicparam;

@end

/**
 *  定义单例
 */
#define SharedControl  ([BMControl sharedInstance])