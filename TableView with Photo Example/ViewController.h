//
//  ViewController.h
//  TableView with Photo Example
//
//  Created by Dino Phan on 8/24/14.
//  Copyright (c) 2014 Dino Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *tableImagesList;
    NSMutableArray *arrayImagesList;
}

- (IBAction)reloadTable:(id)sender;

@end
