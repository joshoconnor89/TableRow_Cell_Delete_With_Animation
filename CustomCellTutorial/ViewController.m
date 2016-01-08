//
//  ViewController.m
//  CustomCellTutorial
//
//  Created by Josh O'Connor.
//  Copyright (c) 2015 Josh O'Connor. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomCell.h"

@interface ViewController () <CellDelegate>

@property (strong, nonatomic) NSMutableArray * items;
@end

@implementation ViewController

-(void)viewDidLoad {
    
    self.items = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCustomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
        [tableView registerNib:[UINib nibWithNibName:@"MyCustomCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
        cell.delegate = self;
        cell.leftLabel.text = [self.items objectAtIndex:indexPath.row];
        cell.deleteButton.tag = indexPath.row;
    
    NSLog(@"%ld", cell.deleteButton.tag);
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 319;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - FEED CELL DELEGATE

-(void)didDeleteItemAtRow:(NSInteger)row {
    [UIView animateWithDuration:1.0 animations:^{

    [CATransaction begin];
    [self.tableView beginUpdates];
    [CATransaction setCompletionBlock: ^{
        [self.tableView reloadData];
    }];
    
    [self.items removeObjectAtIndex:row];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
        
    [self.tableView endUpdates];
    [CATransaction commit];
    }];
    
}

@end
