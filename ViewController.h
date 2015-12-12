//
//  ViewController.h
//  CrossoverNodeApp
//
//  Created by Thiago Guimaraes on 11/9/15.
//  Copyright (c) 2015 ThiagoGuimaraes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrossoverModel.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, CrossoverModelProtocol>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (weak, nonatomic) IBOutlet UIButton *Node1;
@property (weak, nonatomic) IBOutlet UIButton *Node2;
@property (weak,nonatomic) IBOutlet UIButton *Node3;
@property (strong, nonatomic) IBOutlet UIView *backgroundTap;

- (IBAction)Node1:(id)sender;
- (IBAction)Node2:(id)sender;
- (IBAction)Node3:(id)sender;
- (IBAction)RootNode:(id)sender;
- (IBAction)backgroundTap:(id)sender;


@end
