//
//  ImageCategoryCollectionViewCell.swift
//  PuzzleGame
//
//  Created by fx on 14-10-11.
//  Copyright (c) 2014年 FS. All rights reserved.
//

import UIKit

class ImageCategoryCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    @IBOutlet weak var footLabel: UILabel!
    @IBOutlet weak var imvMain: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var _imagecategory:ImageCategory?
    
    func setimagecategory(imagecategory:ImageCategory)
    {
        _imagecategory = imagecategory
//        let bundle1:NSBundle = BMContext.sharedInstance().getContextDicForKey(COREBUNDLENAME) as NSBundle
        var path:String?=nil
        if(imagecategory.imagepath == nil)
        {
            path = "defultImageCategory.png"
        }
        else
        {
            path = (BMContext.sharedInstance().getContextDicForKey(COREBUNDLENAME) as String) + "/" + imagecategory.imagepath
//             path = bundle1.pathForResource("img2", ofType: "png", inDirectory: "ImageCategory/卡通")! as String
            
        }
        println("\(path)")
        
        
//        let bundlePath:NSString? = NSBundle.mainBundle().pathForResource(COREBUNDLENAME, ofType: "bundle")
//        
//        let bundle1:NSBundle? = NSBundle(path:bundlePath!)
        

//
//        imvMain.image = UIImage(named: "ImageCategory/电影/img5.png", inBundle: bundle1, compatibleWithTraitCollection: nil)
     //   imvMain.image = CommonalityFunction.loadImage(path!)
        
//        let strrr:String  = bundle1!.pathForResource("img5", ofType: "png", inDirectory: "ImageCategory/电影/") as String
        
        
//                    let aryImageInfo:NSArray = bundle1!.pathsForResourcesOfType("png", inDirectory: "1") as NSArray
        
//        let strre:String = bundle1.pathForResource("img2", ofType: "png", inDirectory: "ImageCategory/卡通")! as String
//        
//        println("\(strre)")
        
  //      let image123:UIImage = UIImage(named: strre)
//        imvMain.image = UIImage(contentsOfFile: strre)
//        imvMain.image = CommonalityFunction.loadImage(strre)
//        imvMain.image = UIImage(contentsOfFile: strre)
        
//        self.imvMain.image = image123
//        println("\(imvMain.image)")
//
//        
////            init(named name: String, inBundle bundle: NSBundle?, compatibleWithTraitCollection traitCollection: UITraitCollection?) -> UIImage
//        
//        
//        
       imvMain.image = UIImage(named: path!)
        
       // -(void)applyEffectRoundRectSilverBorder:(UIColor*) color
        
        imvMain.applyEffectRoundRectSilverBorder(UIColor.whiteColor())
              println("\(imvMain.image)")
        
        titleLabel.text = "Hot"
        footLabel.text = imagecategory.name
//        imvMain.image = UIImage(named: "ImageCategory/电影/img2.png", inBundle: bundle1, compatibleWithTraitCollection:   nil  )
    }
}
