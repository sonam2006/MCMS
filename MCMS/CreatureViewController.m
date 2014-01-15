//
//  CreatureViewController.m
//  MCMS
//
//  Created by Matthew Voracek on 1/14/14.
//  Copyright (c) 2014 Matthew Voracek. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"
#import "ViewController.h"

@interface CreatureViewController ()
{
    __weak IBOutlet UILabel *name;
    __weak IBOutlet UITextField *nameTextField;
    
}

@end

@implementation CreatureViewController
@synthesize creature;

- (IBAction)onEditButtonPressed:(id)sender
{
    name.alpha = 0;
    nameTextField.alpha = 1;
    nameTextField.text = name.text;
}

- (IBAction)onSaveButtonPressed:(id)sender
{
    name.text = nameTextField.text;
    creature.name = name.text;
    name.alpha = 1;
    nameTextField.alpha = 0;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    name.text = creature.name;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
