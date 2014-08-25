//
//  ViewController.m
//  TableView with Photo Example
//
//  Created by Dino Phan on 8/24/14.
//  Copyright (c) 2014 Dino Phan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayImagesList = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 11; i++) {
        [arrayImagesList addObject:[NSString stringWithFormat:@"%d.jpg", i]];
    }
    
    [self setTitle:@"Images List"];
    
    tableImagesList.delegate = self;
    tableImagesList.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrayImagesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIndentifier" forIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIndentifier"];
    }
    [(UIImageView *)[cell viewWithTag:100] setImage:[UIImage imageNamed:[arrayImagesList objectAtIndex:indexPath.row]]];
    if (indexPath.row==0) {
        [(UIButton *)[cell viewWithTag:101] setEnabled:NO];
    }
    else {
        [(UIButton *)[cell viewWithTag:101] setEnabled:YES];
    }
    if (indexPath.row==([arrayImagesList count] - 1)) {
        [(UIButton *)[cell viewWithTag:103] setEnabled:NO];
    }
    else {
        [(UIButton *)[cell viewWithTag:103] setEnabled:YES];
    }
    [(UIButton *)[cell viewWithTag:101] addTarget:self action:@selector(moveUp:) forControlEvents:UIControlEventTouchUpInside];
    [(UIButton *)[cell viewWithTag:103] addTarget:self action:@selector(moveDown:) forControlEvents:UIControlEventTouchUpInside];
    [(UIButton *)[cell viewWithTag:102] addTarget:self action:@selector(deleteRow:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section==0) {
        return @"Example: http://facebook.com/dinophanhk";
    }
    return nil;
}

- (void)moveUp:(id)sender {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:tableImagesList];
    NSIndexPath *indexPath = [tableImagesList indexPathForRowAtPoint:buttonPosition];
    [self moveObjectFromIndex:indexPath.row toIndex:(indexPath.row - 1)];
}

- (void)moveDown:(id)sender {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:tableImagesList];
    NSIndexPath *indexPath = [tableImagesList indexPathForRowAtPoint:buttonPosition];
    [self moveObjectFromIndex:indexPath.row toIndex:(indexPath.row + 1)];
}

- (void)deleteRow:(id)sender {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:tableImagesList];
    NSIndexPath *indexPath = [tableImagesList indexPathForRowAtPoint:buttonPosition];
    [arrayImagesList removeObjectAtIndex:indexPath.row];
    [tableImagesList reloadData];
}

- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to
{
    if (to != from) {
        id obj = [arrayImagesList objectAtIndex:from];
        [arrayImagesList removeObjectAtIndex:from];
        if (to >= [arrayImagesList count]) {
            [arrayImagesList addObject:obj];
        } else {
            [arrayImagesList insertObject:obj atIndex:to];
        }
    }
    [tableImagesList reloadData];
}

- (IBAction)reloadTable:(id)sender {
    for (int i = 1; i <= 11; i++) {
        [arrayImagesList addObject:[NSString stringWithFormat:@"%d.jpg", i]];
    }
    NSLog(@"Load data...");
    [tableImagesList reloadData];
    NSLog(@"Loaded.");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
