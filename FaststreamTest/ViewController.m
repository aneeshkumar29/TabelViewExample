//
//  ViewController.m
//  FaststreamTest
//
//  Created by Dev009 on 1/12/15.
//  Copyright (c) 2015 Dev009. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

#define SERVER_URL @"http://192.254.141.167/~fstech/pic.php"
@interface ViewController ()

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self.myTableView setEditing:TRUE animated:TRUE];
    // Do any additional setup after loading the view from its nib.
    [self getServerData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getServerData
{
    NSString* urlString = SERVER_URL;
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        if (connectionError == nil) {
            NSError* error;
            self.dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSLog(@"%@", [self.dict description]);
            [self.myTableView reloadData];
        }
    }];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray* array = [self.dict valueForKey:@"items"];
    return array.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"CELL_ID";
    CustomCell* cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
    }
    
    NSMutableArray* array = [self.dict valueForKey:@"items"];
    NSDictionary* dict1 = [array objectAtIndex:indexPath.row];
    cell.cellLabel.text = [dict1 valueForKey:@"title"];
    
    
    NSString* imageURL = [dict1 valueForKey:@"url"];
    NSURL* url = [NSURL URLWithString:imageURL];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse * response,
                                               NSData * data,
                                               NSError * error) {
                               if (!error){
                                   cell.cellImage.image = [UIImage imageWithData:data];
                               }                               
                           }];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 133;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Welcome ");
    CustomCell* cell = (CustomCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell removeFromSuperview];
    
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}



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
