
#import <BMCoreFramework/BMCoreFramework.h>
/*!
 @header BMBaseViewController (AFNetworking)
 @abstract 关于这个源代码文件的一些基本描述
 @author Kevin Wu (作者信息)
 @version 1.00 2012/01/20 Creation (此文档的版本信息)
 */
@interface BMBaseViewController (AFNetworking)

-(void)addPullToRefresh:(UIScrollView*)scrollview;

/*!
 *  结束刷新
 *
 *  @param scrollview 需要刷新的scrollview
 */
-(void)endPullToRefresh:(UIScrollView*)scrollview;
/*!
 *  加载下拉刷新
 *
 *  @param scrollview 需要刷新的scrollview
 */
-(void)addPullToTopRefresh:(UIScrollView*)scrollview;

/*!
 *  加载上拉刷新
 *
 *  @param scrollview 需要刷新的scrollview
 */
-(void)addPullToBottomRefresh:(UIScrollView*)scrollview;

/*!
 *  下拉刷新的回调
 */
-(void)insertRowAtTop;
/*!
 *  上拉刷新回调
 */
-(void)insertRowAtBottom;


@end
