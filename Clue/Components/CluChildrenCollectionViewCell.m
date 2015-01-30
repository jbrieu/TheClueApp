//
//  CluChildrenCollectionViewCell.m
//  Clue
//
//  Created by Jean-Baptiste Rieu on 25/01/2015.
//  Copyright (c) 2015 jbrieu. All rights reserved.
//

#import "CluChildrenCollectionViewCell.h"
#import "CluItem.h"

@interface CluChildrenCollectionViewCell()

@property (weak, nonatomic, readwrite) IBOutlet UILabel *childrenNameLabel;
@property (weak, nonatomic, readwrite) IBOutlet UITextField *wordTextField;
@property (strong, nonatomic, readwrite) CluItem *item;

@end

@implementation CluChildrenCollectionViewCell

-(void)setupWithItem:(CluItem *)inItem
{
    self.item = inItem;
    
    if(self.item.name==nil && self.item.imageName==nil)
    {
        self.childrenNameLabel.hidden = YES;
        self.wordTextField.hidden = NO;
        
        self.wordTextField.delegate = self;
    }
    else{
        self.childrenNameLabel.hidden = NO;
        self.wordTextField.hidden = YES;
    }

    self.childrenNameLabel.text =  self.item.name;
    self.wordTextField.text =  self.item.name;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.wordTextField) {
        [textField resignFirstResponder];
        [self.delegate CluChildrenCollectionViewCellDidChangeName:self.wordTextField.text forItem:self.item];
        return NO;
    }
    return YES;
}

// Appeler CluChildrenCollectionViewCellDelegate did change sur changement et refaire le setup pour cacher le champ
// En cas de tap long se mettre aussi en mode edit

@end
