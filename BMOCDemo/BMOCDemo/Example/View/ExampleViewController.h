
#import <UIKit/UIKit.h>

/**
 *  例子ViewController
 */
@interface ExampleViewController : BMBaseViewController
/**
 *  城市代码
 */
@property (nonatomic,strong) NSString *cityCodeStr;
@property (weak, nonatomic) IBOutlet UILabel *tempLb;
@property (weak, nonatomic) IBOutlet UILabel *wdLb;
@property (weak, nonatomic) IBOutlet UILabel *wsLb;
@property (weak, nonatomic) IBOutlet UILabel *sdLb;
@property (weak, nonatomic) IBOutlet UILabel *wseLb;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UILabel *cityLb;




@property (weak, nonatomic) IBOutlet UILabel *percentageLb;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;



/**
 *  根据城市code初始化
 *
 *  @param strCityCode 城市code
 *
 *  @return 实例
 */
-(id)initWithCityCode:(NSString*)strCityCode;
@end
