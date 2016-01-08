//
//  MyCustomCell.h
//  CustomCellTutorial
//
//  Created by Josh O'Connor.
//  Copyright (c) 2015 Josh O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@protocol CellDelegate <NSObject>

@optional
-(void)didDeleteItemAtRow:(NSInteger)row;

@end

@interface MyCustomCell : UITableViewCell <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak) id<CellDelegate> delegate;

@end
