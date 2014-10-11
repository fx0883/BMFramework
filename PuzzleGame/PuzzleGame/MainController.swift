//
//  ViewController.swift
//  PuzzleGame
//
//  Created by fx on 14-10-10.
//  Copyright (c) 2014年 FS. All rights reserved.
//

import UIKit

class MainController: UIViewController {

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
        
        self.navigationController?.navigationBar .setBackgroundImage(UIImage(named: "header-bg-big"), forBarMetrics: UIBarMetrics.Default)
        
//        self.mainCV.registerClass(ImageCategoryCollectionViewCell.self, forCellWithReuseIdentifier: kCollectionCell)
        
        //ImageCategoryCollectionViewCell
        
        let nib:UINib = UINib(nibName: "ImageCategoryCollectionViewCell", bundle: nil)
        
        
        self.mainCV.registerNib(nib, forCellWithReuseIdentifier: kCollectionCell)
        
//        self.mainCV.allowsMultipleSelection = true
//        
//        self.mainCV.allowsSelection=true
        
//        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.edgesForExtendedLayout = UIRectEdge.None
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
        
        
        return 7
 
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell:ImageCategoryCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(kCollectionCell, forIndexPath: indexPath) as ImageCategoryCollectionViewCell
        
//        let imagecategoryitem : ImageCategory = imageCategoryAry!.objectAtIndex(indexPath.row) as ImageCategory
//        
        cell.backgroundColor = UIColor.redColor()
//        cell.setimagecategory(imagecategoryitem)
//        cell.sizeToFit()
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
       return 1
    }
    
    //设置元素的的大小框
//    -(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//    {
//        UIEdgeInsets top = {5,10,15,5};
//        return top;
//    }
    
    
    
    // The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
//    optional func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView

}

