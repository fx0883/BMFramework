//
//  ViewController.swift
//  PuzzleGame
//
//  Created by fx on 14-10-10.
//  Copyright (c) 2014年 FS. All rights reserved.
//

import UIKit

class MainController: BaseViewController {

    @IBOutlet weak var mainCV: UICollectionView!
    @IBOutlet weak var bgImv: UIImageView!
    let kCollectionCell:String = "ImageCategoryCell"
    var imageCategoryAry:NSArray? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initView()
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initView()
    {
//        header-bg-big
        mainCV.alwaysBounceVertical = true;
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "header-bg-big"), forBarMetrics: UIBarMetrics.Default)
        
//        self.mainCV.registerClass(ImageCategoryCollectionViewCell.self, forCellWithReuseIdentifier: kCollectionCell)
        
        //ImageCategoryCollectionViewCell
        
        let nib:UINib = UINib(nibName: "ImageCategoryCollectionViewCell", bundle: nil)
        
        
        self.mainCV.registerNib(nib, forCellWithReuseIdentifier: kCollectionCell)
        self.edgesForExtendedLayout = UIRectEdge.None
        
        
        self.addNavRightButton("bclose")
        self.addNavLeftButton("bclose")
        
    }
    
    func rightBarButtonItemClick(sender:UIButton)
    {
       println("right")
        //-(void)customShareMenuClickHandler:(UIButton *)sender;
        
        ShareSDKManager.sharedInstance().noneUIShareAllButtonClickHandler(sender)
    }
    
    func leftBarButtonItemClick(sender:UIButton)
    {
        println("left")
    }
    
    
    func loadData()
    {
        imageCategoryAry = ImageCategory.MR_findAll()
        
        
        for imageCategoryitem in imageCategoryAry!
        {
            //imageCategoryitem as ImageCategory
            
            let item:ImageCategory = imageCategoryitem as ImageCategory
            let imageCategoryId:String = item.id
            
            let itemAry:NSArray = ImageInfo.MR_findAll()
            if(itemAry.count>0)
            {
                let randomNumber:Int = self.randomEx(itemAry.count)
                let imageinfo:ImageInfo = itemAry.objectAtIndex(randomNumber) as ImageInfo
                item.imagepath = imageinfo.path
            }
        }
        
    }
    
    func randomEx(number:Int)->Int
    {
        let randomNumber:Int = random() % number
        return randomNumber
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        var intNumber:Int = 0
        
        if(imageCategoryAry != nil)
        {
            intNumber = imageCategoryAry!.count
        }
        
        
        return intNumber
 
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell:ImageCategoryCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(kCollectionCell, forIndexPath: indexPath) as ImageCategoryCollectionViewCell
        
        let imagecategoryitem : ImageCategory = imageCategoryAry!.objectAtIndex(indexPath.row) as ImageCategory
//        
//        cell.backgroundColor = UIColor.redColor()
        cell.setimagecategory(imagecategoryitem)
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
    
//    func collectionView(collectionView:UICollectionView 
    
    // The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
//    {
//        
//        println("===============")
//        return UICollectionReusableView()
//    }
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath)
    {
        let imagecategoryitem : ImageCategory = imageCategoryAry!.objectAtIndex(indexPath.row) as ImageCategory
        
        let imageListVC:ImageListViewController = ImageListViewController(imgCategory: imagecategoryitem)
        
        self.navigationController?.pushViewController(imageListVC, animated: true)
        
    }
    

}

