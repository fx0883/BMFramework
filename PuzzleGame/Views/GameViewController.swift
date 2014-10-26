//
//  GameViewController.swift
//  PuzzleGame
//
//  Created by fx on 14/10/26.
//  Copyright (c) 2014年 FS. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var gameview: GameView!
    @IBOutlet weak var disorganizeButton: UIButton!
    @IBOutlet weak var originalPicButton: UIButton!
    var curImageInfo:ImageInfo? = nil
    var breakBtnStatus:Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
        // Do any additional setup after loading the view.
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "GameViewController", bundle: nibBundleOrNil)
        // Custom initialization
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
        }
        
        
        
//        let image:UIImage = UIImage(named: self.curImageInfo?.path)
//        self.gameview.setGameImage:UIImage(named:)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func originalPicButton(sender: UIButton) {
    }
    
    
    @IBAction func disorganizeButton(sender: UIButton) {
        switch self.breakBtnStatus
        {
        case 1:
            breakBtnStatus=2;
//            [breakBtn setTitle:@"停止" forState:UIControlStateNormal];
            
            disorganizeButton.setTitle("停止", forState: UIControlState.Normal)
//            showSourceBtn.hidden=YES;
//            changeImageBtn.hidden=YES;
            gameview.startBreak();
            break;
        case 2:
            breakBtnStatus=1;
            disorganizeButton.setTitle("打乱", forState: UIControlState.Normal)
            
//            showSourceBtn.hidden=NO;
//            changeImageBtn.hidden=NO;
            
            gameview.stopBreak();
            break;
        default:
            break;
        }

        
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
