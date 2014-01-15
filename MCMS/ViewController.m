//
//  ViewController.m
//  MCMS
//
//  Created by Matthew Voracek on 1/14/14.
//  Copyright (c) 2014 Matthew Voracek. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *creatures;
    
    __weak IBOutlet UITextField *magicalCreatureTextField;
    __weak IBOutlet UITableView *myTableView;
    MagicalCreature *creature;
}

@end

@implementation ViewController
- (IBAction)onAddButtonPressed:(id)sender
{
    
    creature = [[MagicalCreature alloc] init];
    creature.name = magicalCreatureTextField.text;
    [creatures addObject:creature];
 
    [myTableView reloadData];
    magicalCreatureTextField.text = nil;
    [magicalCreatureTextField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	creatures = [NSMutableArray array];
    
    creature = [[MagicalCreature alloc] init];
    creature.name = @"Billy";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Bertha";
    [creatures addObject:creature];
    
    creature = [MagicalCreature new];
    creature.name = @"Bobby";
    [creatures addObject:creature];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCellID"];
    MagicalCreature *myCreature = creatures [indexPath.row];
    cell.textLabel.text = myCreature.name;
  
   
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return creatures.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [myTableView indexPathForSelectedRow];
    vc.creature = creatures[indexPath.row];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
