//
//  ViewController.h
//  FaststreamTest
//
//  Created by Dev009 on 1/12/15.
//  Copyright (c) 2015 Dev009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSDictionary* dict;

@end
