//
//  MyCustomCell.m
//  CustomCellTutorial
//
//  Created by Josh O'Connor.
//  Copyright (c) 2015 Josh O'Connor. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)deletePost:(id)sender {

    NSLog(@"dot dot dot button pressed");
    
    
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                                      @"Flag",
                                      @"Delete",
                                      nil];
        actionSheet.tag=2;
        [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    

}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    switch (actionSheet.tag) {
        case 2: {
            switch (buttonIndex) {
                case 0:
                    NSLog(@"Flag");
                    
                    break;
                case 1:
                    NSLog(@"Delete");
                    [self deleteAndAnimate];
                    
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}


-(void)deleteAndAnimate {

    [self.delegate didDeleteItemAtRow:self.deleteButton.tag];
    
}


@end
