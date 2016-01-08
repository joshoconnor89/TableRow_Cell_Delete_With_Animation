//
//  ViewController.h
//  CustomCellTutorial
//
//  Created by Josh O'Connor.
//  Copyright (c) 2015 Josh O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
-(void)deletePostAtRow;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
