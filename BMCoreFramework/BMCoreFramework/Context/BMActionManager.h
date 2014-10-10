
#import <Foundation/Foundation.h>


/**
 *  Action 管理类
 */
@interface BMActionManager : NSObject
/**
 *  单例宏的调用
 */
AS_SINGLETON(BMActionManager)

@property (nonatomic,strong) NSMutableDictionary *actionDic;


-(void)registerAllAction;
/**
 *  @brief 通过ActionId获取BMBaseAction
 *
 *  @param strActionId ActionId
 *
 *  @return 获取一个指向BMBaseAction的指针
 */
-(BMBaseAction*)getAction:(NSString*)strActionId;

/**
 *  注册一个Action
 *
 *  @param strActionId ActionId
 *  @param baseAction  所创建的Action指针
 */
-(void)registAction:(NSString*)strActionId
          action:(BMBaseAction*)baseAction;

/**
 *  反注册一个Action
 *
 *  @param strActionId ActionId
 */
-(void)unRegistAction:(NSString*)strActionId;

/**
 *  选择执行Action
 *
 *  @param dicparam 传入传出参数
 */
-(void)excute:(NSMutableDictionary*)dicparam;
@end


#define SharedActionManager  ([BMActionManager sharedInstance])