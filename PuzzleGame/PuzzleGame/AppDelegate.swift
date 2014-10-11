//
//  AppDelegate.swift
//  PuzzleGame
//
//  Created by fx on 14-10-10.
//  Copyright (c) 2014年 FS. All rights reserved.
//

import UIKit
let kPuzzleDBName:String = "PuzzleImageDb.sqlite"
let COREBUNDLENAME:String = "CoreBundle"
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        [self copyDefaultStoreIfNecessary];
//        [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelVerbose];
//        [MagicalRecord setupCoreDataStackWithStoreNamed:kRecipesStoreName];
        self.copyDefaultStoreIfNecessary()
        MagicalRecord.setLoggingLevel(MagicalRecordLoggingLevel.Verbose)
        MagicalRecord.setupCoreDataStackWithStoreNamed(kPuzzleDBName)
        
        self.loadData()
        return true
    }
    
    func loadData()
    {
        
        let bundlePath:NSString? = NSBundle.mainBundle().pathForResource(COREBUNDLENAME, ofType: "bundle")
        
        
        let bundle:NSBundle? = NSBundle(path:bundlePath!)
        BMContext.sharedInstance().setContextDic(bundle, forKey: COREBUNDLENAME)
        let ary:NSArray = ImageCategory.MR_findAll()
        let intCount:Int = ary.count
        if(intCount > 0)
        {
            //return
        }
        
//        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:COREBUNDLENAME ofType:@"bundle"];
//        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        

        

        
        
//        let aryImageCategory:NSArray = bundle.pathsForResourcesOfType("", inDirectory: "ImageCategory")
        
//                let aryImageCategory:NSArray = bundle?.pathsForResourcesOfType("", inDirectory subpath: "ImageCategory") as NSArray
        
        
        let aryImageCategory:NSArray = bundle!.pathsForResourcesOfType("", inDirectory: "ImageCategory") as NSArray
        
        for imageCategoryitem in aryImageCategory
        {
            let item:ImageCategory = ImageCategory.MR_createEntity()
            item.name=imageCategoryitem as NSString;
            item.id = NSUUID.UUID().UUIDString;
            
            item.name = item.name.lastPathComponent
            
            let strSubDirctory:String = "ImageCategory/"+item.name
            
            println("\(strSubDirctory)")
            
            let aryImageInfo:NSArray = bundle!.pathsForResourcesOfType("png", inDirectory: strSubDirctory) as NSArray
            
            for imageInfoitem in aryImageInfo
            {
                let itemImageInfo:ImageInfo = ImageInfo.MR_createEntity()
                itemImageInfo.id = item.id
                
                itemImageInfo.path = imageInfoitem as NSString
                
                println("\(imageInfoitem)")
                
                let im:UIImage = UIImage(named: itemImageInfo.path)
                
                itemImageInfo.path = itemImageInfo.path.lastPathComponent
                
                itemImageInfo.path = strSubDirctory+"/"+itemImageInfo.path
                
                println("\(itemImageInfo.path)")
            }
            
        }
        
//        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        
        
//        NSArray *ary = [bundle pathsForResourcesOfType:@"" inDirectory:@"ImageCategory"];
//        for (NSObject *obj in ary)
//            
//            NSString *strObj = (NSString*)obj;
//            
//            
//            
//            strObj = [strObj lastPathComponent];
//            strObj = [NSString stringWithFormat:@"ImageCategory/%@",strObj];
//            NSArray *ary2 = [bundle pathsForResourcesOfType:@"png" inDirectory:strObj];
//            
//            for (NSString *obj2 in ary2) {
//                NSLog(@"%@",obj2);
//                
//                UIImage *img = [UIImage imageNamed:obj2];
//                NSLog(@"%@",img);
//            }
//            
//            NSLog(@"%@",strObj);
//        }

    }
    
    
    
    
    
    func copyDefaultStoreIfNecessary()
    {
        let fileManager:NSFileManager = NSFileManager.defaultManager()
        //
        //    NSURL *storeURL = [NSPersistentStore MR_urlForStoreName:kRecipesStoreName];
        
        let storeURL:NSURL = NSPersistentStore.MR_urlForStoreName(kPuzzleDBName)
        
        if(!fileManager.fileExistsAtPath(storeURL.path!))
        {
            let defaultStorePath:NSString? = NSBundle.mainBundle().pathForResource(kPuzzleDBName.stringByDeletingPathExtension, ofType: kPuzzleDBName.pathExtension)
            
            if(defaultStorePath  != nil)
            {
                var error:NSErrorPointer? = nil
                let success:Bool = fileManager.copyItemAtPath(defaultStorePath!, toPath: storeURL.path!, error: error!)
                
                if(!success)
                {
                    println("Failed to install default recipe store")
                }
                
            }
            
        }
        //
        //    // If the expected store doesn't exist, copy the default store.
        //    if (![fileManager fileExistsAtPath:[storeURL path]])
        //    {
        //    NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:[kRecipesStoreName stringByDeletingPathExtension] ofType:[kRecipesStoreName pathExtension]];
        //
        //    if (defaultStorePath)
        //    {
        //    NSError *error;
        //    BOOL success = [fileManager copyItemAtPath:defaultStorePath toPath:[storeURL path] error:&error];
        //    if (!success)
        //    {
        //    NSLog(@"Failed to install default recipe store");
        //    }
        //    }
        //    }
    }
    
//    - (void) copyDefaultStoreIfNecessary;
//    {
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    NSURL *storeURL = [NSPersistentStore MR_urlForStoreName:kRecipesStoreName];
//    
//    // If the expected store doesn't exist, copy the default store.
//    if (![fileManager fileExistsAtPath:[storeURL path]])
//    {
//    NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:[kRecipesStoreName stringByDeletingPathExtension] ofType:[kRecipesStoreName pathExtension]];
//    
//    if (defaultStorePath)
//    {
//    NSError *error;
//    BOOL success = [fileManager copyItemAtPath:defaultStorePath toPath:[storeURL path] error:&error];
//    if (!success)
//    {
//    NSLog(@"Failed to install default recipe store");
//    }
//    }
//    }
//    
//    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

