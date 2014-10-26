//
//  ImageListViewController.swift
//  PuzzleGame
//
//  Created by fx on 14/10/23.
//  Copyright (c) 2014年 FS. All rights reserved.
//

import UIKit

class ImageListViewController: UIViewController {

    
    @IBOutlet weak var mainCV: UICollectionView!

    var curImageCategory:ImageCategory?=nil
    var imageListArray:NSArray? = nil
    let kImageListCell:String = "kImageListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loadData()
        self.initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    
    init(imgCategory imgcategory: ImageCategory)
    {
        super.init()
        self.curImageCategory = imgcategory
    }

    required init(coder aDecoder: NSCoder) {
        super.init()
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "ImageListViewController", bundle: nibBundleOrNil)
        // Custom initialization
    }

    
    func initView()
    {
        //        header-bg-big
        mainCV.alwaysBounceVertical = true;
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "header-bg-big"), forBarMetrics: UIBarMetrics.Default)
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = self.curImageCategory?.name
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UIImage(named: "bclose")
        
//        UINavigationBar.appearance().titleTextAttributes = NSDictionary(
        
//        let dic:NSDictionary = NSDictionary.dictionaryWithValuesForKeys(UIColor.whiteColor(), UITextAttributeTextColor,shadow,NSShadowAttributeName,UIFont(name: "HelveticaNeue-CondensedBlack", size: 21.0),NSFontAttributeName,nil)
        
//        let dic:NSDictionary = {  UITextAttributeFont : UIFont(name: "HelveticaNeue-CondensedBlack", size: 21.0),
//            UITextAttributeTextColor: [UIColor whiteColor],
//            UITextAttributeTextShadowColor: [UIColor grayColor],
            //UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero}
       
//        let dic:NSDictionary =
//NSDictionary.dictionaryWithValuesForKeys(UIFont(name: "HelveticaNeue-CondensedBlack", size: 21.0),UITextAttributeFont,UIColor.whiteColor(),UITextAttributeTextColor,nil)
//        UINavigationBar.appearance().titleTextAttributes = dic
        
//        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//            [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
//            shadow, NSShadowAttributeName,
//            [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
        
        
//           init(image: UIImage?, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector)
        
        
        
//        UIButton *searchbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        [searchbutton setBackgroundImage:[UIImage imageNamed:@"sousuodi.png"] forState:UIControlEventTouchUpInside];
//        
//        [searchbutton addTarget:self action:@selector(queryAllCode) forControlEvents:UIControlEventTouchUpInside];
//        
//        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:searchbutton];
//        self.navigationItem.rightBarButtonItem = item;
        
        
        let rightButton:UIButton = UIButton(frame: CGRectMake(0, 0, 40, 40))
        rightButton.setBackgroundImage(UIImage(named: "bclose"), forState: UIControlState.Normal)
        rightButton.addTarget(self, action: "closeBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let nItemRight:UIBarButtonItem = UIBarButtonItem(customView: rightButton)
        
//        let nItemRight:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "bclose"), style: UIBarButtonItemStyle.Bordered, target: self, action: "closeBtnClick:")
        
        
//        textAttributes = @{
//            NSFontAttributeName : SharedFont.fontLargeMedium,
//            NSForegroundColorAttributeName : [UIColor whiteColor],
//            NSShadowAttributeName : shadow,
//            //UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(1, 1)]
//        };
//        let dic:NSDictionary = [
//            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack",size: 21),
//            NSForegroundColorAttributeName :UIColor.whiteColor,
//            NSShadowAttributeName : shadow,nil
//            //UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(1, 1)]
//        ]
//        
        
        
        
        
        
//        -(NSDictionary *)naviBarAttributes {
//            
//            NSDictionary *textAttributes = nil;
//            NSShadow *shadow = [NSShadow new];
//            shadow.shadowColor = [UIColor grayColor];
//            
//            if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0) {
//                textAttributes = @{
//                    NSFontAttributeName : SharedFont.fontLargeMedium,
//                    NSForegroundColorAttributeName : [UIColor whiteColor],
//                    NSShadowAttributeName : shadow,
//                    //UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(1, 1)]
//                };
//            } else {
//                #if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
//                    textAttributes = @{
//                    UITextAttributeFont: SharedFont.fontLargeMedium,
//                    UITextAttributeTextColor: [UIColor whiteColor],
//                    UITextAttributeTextShadowColor: [UIColor grayColor],
//                    //UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetZero]
//                    };
//                #endif
//            }
        

        //將tilte 文字設成白色粗體
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline),NSForegroundColorAttributeName: UIColor(red:1, green:1, blue:1, alpha:1)
        ];
        
        
//        let dic:NSDictionary = NSDictionary.dictionaryWithValuesForKeys(UIColor.whiteColor(),NSForegroundColorAttributeName,shadow,NSShadowAttributeName,nil)
//        self.navigationController.navigationBar.titleTextAttributes =[NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline),NSForegroundColorAttributeName: UIColor(red:1, green:1, blue:1, alpha:1)
//        ];

        self.navigationItem.rightBarButtonItem = nItemRight
        
        let nib:UINib = UINib(nibName: "ImageListCell", bundle: nil)
        self.mainCV.registerNib(nib, forCellWithReuseIdentifier: kImageListCell)
        self.mainCV.backgroundColor = UIColor.clearColor()
        

        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    func closeBtnClick(sender:UIButton!)
    {
        self.navigationController!.popViewControllerAnimated(false)
    }
    
    func loadData()
    {
        
        let predicateImageList:NSPredicate = NSPredicate(format: "categoryid = %@", self.curImageCategory!.id)!
        
        
        println("\(curImageCategory!.id)")
        
        self.imageListArray = ImageInfo.MR_findAllWithPredicate(predicateImageList)
        
        
        
     //   ImageInfo.MR_findAllWithPredicate(searchTerm: NSPredicate!)
        
        
//        imageCategoryAry = ImageCategory.MR_findAll()
        
        
//        for imageCategoryitem in imageCategoryAry!
//        {
//            //imageCategoryitem as ImageCategory
//            
//            let item:ImageCategory = imageCategoryitem as ImageCategory
//            let imageCategoryId:String = item.id
//            
//            let itemAry:NSArray = ImageInfo.MR_findAll()
//            if(itemAry.count>0)
//            {
//                let randomNumber:Int = self.randomEx(itemAry.count)
//                let imageinfo:ImageInfo = itemAry.objectAtIndex(randomNumber) as ImageInfo
//                item.imagepath = imageinfo.path
//            }
//        }
        
    }
    
    func randomEx(number:Int)->Int
    {
        let randomNumber:Int = random() % number
        return randomNumber
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        var intNumber:Int = 0
        
        if(imageListArray != nil)
        {
            intNumber = imageListArray!.count
        }
        
        
        return intNumber
        
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell:ImageListCell = collectionView.dequeueReusableCellWithReuseIdentifier(kImageListCell, forIndexPath: indexPath) as ImageListCell
        
        let imageinfoitem : ImageInfo = imageListArray!.objectAtIndex(indexPath.row) as ImageInfo
        //
        //        cell.backgroundColor = UIColor.redColor()
        cell.setimageinfo(imageinfoitem)
        //        cell.sizeToFit()
        return cell
    }
    
    //        func dequeueReusableSupplementaryViewOfKind(elementKind: String, withReuseIdentifier identifier: String, forIndexPath indexPath: NSIndexPath!) -> AnyObject
    
    //    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    //    {
    //       return 1
    //    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(10, 15, 20, 15);
    }

    //    {
    //
    //        println("===============")
    //        return UICollectionReusableView()
    //    }
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath)
    {
        let imageInfoItem : ImageInfo = imageListArray!.objectAtIndex(indexPath.row) as ImageInfo
        
        let gameVC:GameViewController = GameViewController(imageInfo: imageInfoItem)
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
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
