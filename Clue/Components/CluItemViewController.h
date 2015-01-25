//
//  CluItemViewController.h
//  Clue
//
//  Created by Jean-Baptiste Rieu on 25/01/2015.
//  Copyright (c) 2015 jbrieu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CluItem;

@interface CluItemViewController : UIViewController

@property (nonatomic, readwrite, strong) CluItem* item;

@end
