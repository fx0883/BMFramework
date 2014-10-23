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
        var path:String?=nil
        if(imagecategory.imagepath == nil)
        {
            path = "defultImageCategory"
        }
        else
        {
            path = (BMContext.sharedInstance().getContextDicForKey(COREBUNDLENAME) as String) + "/" + imagecategory.imagepath
//             path = bundle1.pathForResource("img2", ofType: "png", inDirectory: "ImageCategory/卡通")! as String
            
        }
        println("\(path)")
        
        
       imvMain.image = UIImage(contentsOfFile: path!)
        
       // -(void)applyEffectRoundRectSilverBorder:(UIColor*) color
        
        imvMain.applyEffectRoundRectSilverBorder(UIColor.whiteColor())
              println("\(imvMain.image)")
        
        titleLabel.text = "Hot"
        footLabel.text = imagecategory.name
//        imvMain.image = UIImage(named: "ImageCategory/电影/img2.png", inBundle: bundle1, compatibleWithTraitCollection:   nil  )
    }
}
