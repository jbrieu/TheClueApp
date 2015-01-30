//
//  CluChildrenCollectionViewCell.h
//  Clue
//
//  Created by Jean-Baptiste Rieu on 25/01/2015.
//  Copyright (c) 2015 jbrieu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CluItem;

@protocol CluChildrenCollectionViewCellDelegate <NSObject>

-(void)CluChildrenCollectionViewCellDidChangeName:(NSString *)newName forItem:(CluItem *)item;

@end

@interface CluChildrenCollectionViewCell : UICollectionViewCell <UITextFieldDelegate>
@property (strong, nonatomic, readonly) CluItem *item;
@property (strong, nonatomic, readwrite) id<CluChildrenCollectionViewCellDelegate> delegate;

-(void) setupWithItem:(CluItem *)inItem;

@end
