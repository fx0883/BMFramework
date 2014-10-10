//
//  WeatherVC.swift
//  BMSwiftDemo
//
//  Created by fx on 14-9-28.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

import UIKit
class WeatherVC: UITableViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    required init(coder aDecoder: (NSCoder!))  {
        super.init(coder: aDecoder)
    }
    
    
    var weatherbaseclass:WeatherBaseClass?;
    var progressTest:MBProgressHUD? ;
    var _task:NSURLSessionTask? ;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "weatherCell")
        self.loadWeather()
    }
    func loadWeather()
    {
        if (_task != nil)
        {
           _task?.cancel()
        }
        //实例化一个传入传出参数
        var baseparam:BMBaseParam=BMBaseParam()
        //参数
        baseparam.paramString="101200101"
        baseparam.withresultobjectblock = {(intError:Int32,strMsg:String?,obj:AnyObject?) in
            
            println("come back!!!!")
            self.weatherbaseclass = obj as? WeatherBaseClass
            self.tableView.reloadData()
        };
        
        let dicParam:NSMutableDictionary = NSMutableDictionary.createParamDic();
        dicParam.setActionID("ExampleAction", strcmd: "getWeather:");
        dicParam.setParam(baseparam);
         //.excute(dicParam);
        BMControl.sharedInstance().excute(dicParam)
        
        if(progressTest==nil)
        {
            progressTest = MBProgressHUD.showHUDAddedTo(self.view,animated:true)

        }


        
        progressTest!.labelText = "加载中...";

        progressTest!.mode = MBProgressHUDModeIndeterminate;//可以显示不同风格的进度；
        
        _task = baseparam.paramObject as? NSURLSessionTask;

        progressTest?.setAnimatingWithStateOfTask(_task!)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        var intCount:Int = 0
        if((self.weatherbaseclass) != nil)
        {
            intCount = 6
        }
        
        return intCount
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "武汉天气"
    }
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell{
        
         let weatherCell:String = "weatherCell"
        var cell:UITableViewCell? = nil
        
        cell = tableView!.dequeueReusableCellWithIdentifier(weatherCell, forIndexPath: indexPath!) as? UITableViewCell
        
        var strMsg:String?
        
        switch indexPath!.row
            {
            case 0:
                
                strMsg = "  temp:  "+self.weatherbaseclass!.weatherinfo!.temp!
        case 1:
            
            strMsg = "  time:  "+self.weatherbaseclass!.weatherinfo!.time!
        case 2:
            
            strMsg = "  wD:  "+self.weatherbaseclass!.weatherinfo!.wD!
        case 3:
                
                strMsg = "  qy:  "+self.weatherbaseclass!.weatherinfo!.qy!
        case 4:
            
            strMsg = "  wS:  "+self.weatherbaseclass!.weatherinfo!.wS!
        case 5:
            
            strMsg = "  sD:  "+self.weatherbaseclass!.weatherinfo!.sD!

            
            default:
                    println("\(strMsg)")
        }
        
        println("\(strMsg)")
        cell!.textLabel!.text=strMsg
//        cell!.textLabel!.textAlignment = NSTextAlignment.Center

        return cell!
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
}
