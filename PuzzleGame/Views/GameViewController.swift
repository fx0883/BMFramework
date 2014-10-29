//
//  GameViewController.swift
//  PuzzleGame
//
//  Created by fx on 14/10/26.
//  Copyright (c) 2014年 FS. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController,GameViewDelegate {

    @IBOutlet weak var gameview: GameView!
    @IBOutlet weak var disorganizeButton: UIButton!
//    @IBOutlet weak var originalPicButton: UIButton!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    
    @IBOutlet weak var difficultySlider: UISlider!
    
    @IBAction func difficultyChanged(sender: AnyObject) {
        
        let sider:UISlider = sender as UISlider
        difficultyLabel.text = NSString(format: "%d", Int(sider.value))
    }
    var curImageInfo:ImageInfo? = nil
    var bIsFinishedGame:Bool = false
    var breakBtnStatus:Int = 1
    var timer:NSTimer? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
        
        
        // Do any additional setup after loading the view.
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "GameViewController", bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    func finishedGame()
    {
        self.curImageInfo?.isfinished = NSNumber(bool: true)
        self.bIsFinishedGame = true;
        self.startAnimateBannerView()
    }
    
    init(imageInfo imageinfo: ImageInfo)
    {
        super.init()
        self.curImageInfo = imageinfo
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func initView()
    {
//            [gameView setGameImage:[[UIImage imageNamed:[Data nextInnerImg]] CGImage]];
        self.edgesForExtendedLayout = UIRectEdge.None
        var path:String?=nil
        if(self.curImageInfo?.path != nil)
        {
 
            path = (BMContext.sharedInstance().getContextDicForKey(COREBUNDLENAME) as String) + "/" + self.curImageInfo!.path
            
            let image:UIImage = UIImage(contentsOfFile: path!)!
            
            gameview.setGameImage2(image.CGImage)
            
            gameview.layer.borderColor = UIColor.whiteColor().CGColor
            gameview.layer.borderWidth = 1.0
        }
        
        
        self.navigationItem.hidesBackButton = true

        UIImage(named: "bclose")
        
        let rightButton:UIButton = UIButton(frame: CGRectMake(0, 0, 40, 40))
        rightButton.setBackgroundImage(UIImage(named: "bclose"), forState: UIControlState.Normal)
        rightButton.addTarget(self, action: "closeBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let nItemRight:UIBarButtonItem = UIBarButtonItem(customView: rightButton)
        
        //將tilte 文字設成白色粗體
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline),NSForegroundColorAttributeName: UIColor(red:1, green:1, blue:1, alpha:1)
        ];
        
        
        self.navigationItem.rightBarButtonItem = nItemRight

        
        gameview.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func originalPicButton() {
        
        let originalpicviewcontroller:OriginalPicViewController = OriginalPicViewController(imageInfo: self.curImageInfo!)
        
        self.navigationController!.pushViewController(originalpicviewcontroller, animated: true)
        
        
    }
    
    
    
    func closeBtnClick(sender:UIButton!)
    {
        if(self.bIsFinishedGame)
        {
            self.startInterstitialView()
        }
        self.navigationController!.popViewControllerAnimated(true)

        
    }
    
    @IBAction func disorganizeButton(sender: UIButton) {
        switch self.breakBtnStatus
        {
        case 1:
            
            
            breakBtnStatus=2;
//            [breakBtn setTitle:@"停止" forState:UIControlStateNormal];
            
            disorganizeButton.setTitle("原图", forState: UIControlState.Normal)
            let  timeinterval = NSTimeInterval(self.difficultySlider.value/10)
            self.difficultySlider.enabled = false
            
            self.startBreakByTimer(timeinterval)
//            showSourceBtn.hidden=YES;
//            changeImageBtn.hidden=YES;
//            gameview.startBreak();
            break;
        case 2:
//            breakBtnStatus=1;
//            disorganizeButton.setTitle("原图", forState: UIControlState.Normal)
            
//            showSourceBtn.hidden=NO;
//            changeImageBtn.hidden=NO;
            
//            gameview.stopBreak();
            self.originalPicButton()
            break;
        default:
            break;
        }

        
    }
    
    func startBreakByTimer(timeinterval:NSTimeInterval)
    {
        gameview.startBreak();
//        timer=NSTimer(timeInterval: 2, target: self, selector:"timeTick", userInfo: nil, repeats: true)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timeinterval, target: self, selector: "timeTick", userInfo: nil, repeats:false);
        
        
//            init(fireDate date: NSDate, interval ti: NSTimeInterval, target t: AnyObject, selector s: Selector, userInfo ui: AnyObject?, repeats rep: Bool)
        
//        timer = NSTimer(fireDate: NSDate.date, interval: <#NSTimeInterval#>, target: <#AnyObject#>, selector: <#Selector#>, userInfo: <#AnyObject?#>, repeats: <#Bool#>)
//        
      //  timer!.fire();
        
        
    }
    
    func timeTick()
    {
        gameview.stopBreak()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
