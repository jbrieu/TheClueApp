//
//  CluItemViewController.m
//  Clue
//
//  Created by Jean-Baptiste Rieu on 25/01/2015.
//  Copyright (c) 2015 jbrieu. All rights reserved.
//

#import "CluItemViewController.h"
#import "CluItem.h"

@interface CluItemViewController ()

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;

@end

@implementation CluItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(self.item.name!=nil && self.item.children.count == 0)
    {
        self.itemNameLabel.text = self.item.name;
    }else if (self.item.children.count > 0){
        self.itemNameLabel.text = @"(NL)Choisissez une notion";
    }else{
        self.itemNameLabel.text = @"(NL)Aucun choix";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
