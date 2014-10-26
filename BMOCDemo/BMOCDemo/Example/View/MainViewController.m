//
//  MainViewController.m
//  BMFrameworkDemo
//
//  Created by fx on 14-9-11.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//



#import "MainViewController.h"
#import "ExampleViewController.h"
#import "DownloadViewController.h"
#import "SoapInvokeViewController.h"

enum LISTFUNCTIONENUM
{
    WeatherNotice= 0,
    DownloadFile,
    SOAPINVOKE
    
};

@interface MainViewController ()
{
    
}
@property (nonatomic,strong) NSArray *listFunction;
@end

@implementation MainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self loadData];
    }
    return self;
}

-(void)loadData
{
    _listFunction=[NSArray arrayWithObjects:@"天气预告",@"断点下载",@"soap调用",nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"BMFramework Demo";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    int rowCount=1;
    
    return rowCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    int rowCount=0;
    rowCount = [_listFunction count];
    return rowCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    // Configure the cell...
    
    cell.textLabel.text = [_listFunction objectAtIndex:indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case WeatherNotice:
        {
          ExampleViewController *exampleviewcontroller = [[ExampleViewController alloc]initWithCityCode:@"101200101"];
            [self.navigationController pushViewController:exampleviewcontroller animated:YES];
        }
            break;
        case DownloadFile:
        {
            DownloadViewController *downloadviewcontroller = [DownloadViewController new];
            [self.navigationController pushViewController:downloadviewcontroller animated:YES];
            }
 
            break;
            
        case SOAPINVOKE:
        {
            SoapInvokeViewController *soapinvokeviewcontroller = [SoapInvokeViewController new];
            [self.navigationController pushViewController:soapinvokeviewcontroller animated:YES];
        }
            
            break;
        default:
            break;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
