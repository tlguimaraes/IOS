//
//  ViewController.m
//  CrossoverNodeApp
//
//  Created by Thiago Guimaraes on 11/9/15.
//  Copyright (c) 2015 ThiagoGuimaraes. All rights reserved.

#import "ViewController.h"
#import "DataLoad.h"

@interface ViewController ()
{
    CrossoverModel *_crossoverModel;
    NSArray *_feedItems;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    [_Node1 setHidden:YES];
    [_Node2 setHidden:YES];
    [_Node3 setHidden:YES];
    
    // Set this view controller object as the delegate and data source for the table view
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _crossoverModel = [[CrossoverModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _crossoverModel.delegate = self;
    
    // Call the download items method of the home model object
    [_crossoverModel downloadItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.listTableView reloadData];
}

#pragma mark Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of feed items (initially 0)
    return _feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    DataLoad *item = _feedItems[indexPath.row];
    
    // Get references to labels of cell
    myCell.textLabel.text = item.fq_name;
    
    return myCell;
}


//================


- (IBAction)Node1:(id)sender {
    
    
}
- (IBAction)Node2:(id)sender {
    
}
- (IBAction)Node3:(id)sender {
    
}

//Once clicked in RootNode it will show all other node options
- (IBAction)RootNode:(id)sender {
    _Node1.enabled=YES;
    [_Node1 setHidden:NO];
    _Node2.enabled=YES;
    [_Node2 setHidden:NO];
    _Node3.enabled=YES;
    [_Node3 setHidden:NO];
    
}




//Clean all nodes once you click in background
- (IBAction)backgroundTap:(id)sender{
    
    //[self.view _Node1 setH]
    [_Node1 setHidden:YES];
    [_Node2 setHidden:YES];
    [_Node3 setHidden:YES];
    _Node1.enabled=NO;
    _Node2.enabled=NO;
    _Node3.enabled=NO;
}


@end
