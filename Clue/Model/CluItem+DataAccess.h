//
//  ClueItem+Constructor.h
//  Clue
//
//  Created by Jean-Baptiste Rieu on 30/01/2015.
//  Copyright (c) 2015 jbrieu. All rights reserved.
//

#import "CluItem.h"

@interface CluItem (DataAccess)

-(void) addBlankChildInMOC:(NSManagedObjectContext *)manageObjectContext;

-(void) renameWord:(NSString *)newName inMOC:(NSManagedObjectContext *)manageObjectContext;

-(NSUInteger) numberOfChildrenWithNoName;

@end
