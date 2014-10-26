//
//  OriginalPicViewController.swift
//  PuzzleGame
//
//  Created by fx on 14/10/26.
//  Copyright (c) 2014年 FS. All rights reserved.
//

import UIKit

class OriginalPicViewController: UIViewController {

    @IBOutlet weak var originalView: UIImageView!
    
    var curImageInfo:ImageInfo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        // Do any additional setup after loading the view.
    }
    

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "OriginalPicViewController", bundle: nibBundleOrNil)
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
            originalView.image = image;
            originalView.layer.borderColor = UIColor.whiteColor().CGColor
            originalView.layer.borderWidth = 1.0
        }
        
        self.navigationItem.hidesBackButton = true
        
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UIImage(named: "bclose")
        
        
        
        
        let rightButton:UIButton = UIButton(frame: CGRectMake(0, 0, 40, 40))
        rightButton.setBackgroundImage(UIImage(named: "bclose"), forState: UIControlState.Normal)
        rightButton.addTarget(self, action: "closeBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let nItemRight:UIBarButtonItem = UIBarButtonItem(customView: rightButton)
        //將tilte 文字設成白色粗體
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline),NSForegroundColorAttributeName: UIColor(red:1, green:1, blue:1, alpha:1)
        ];
        
        
        self.navigationItem.rightBarButtonItem = nItemRight
    }

    func closeBtnClick(sender:UIButton!)
    {
        self.navigationController!.popViewControllerAnimated(true)
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
