//
//  ClueItem+Constructor.m
//  Clue
//
//  Created by Jean-Baptiste Rieu on 30/01/2015.
//  Copyright (c) 2015 jbrieu. All rights reserved.
//

#import "CluItem+DataAccess.h"

@implementation CluItem (DataAccess)

-(void) addBlankChildInMOC:(NSManagedObjectContext *)manageObjectContext
{
    CluItem *blankChild = [NSEntityDescription insertNewObjectForEntityForName:@"CluItem" inManagedObjectContext:manageObjectContext];
    [self addChildrenObject:blankChild];
    
    [manageObjectContext save:nil];
}

-(void) renameWord:(NSString *)newName inMOC:(NSManagedObjectContext *)manageObjectContext
{
    self.name = newName;
    
    [manageObjectContext save:nil];
}

-(NSUInteger) numberOfChildrenWithNoName
{
    NSPredicate *noNamePredicate = [NSPredicate predicateWithFormat:@"name == nil"];
    return [[self.children filteredSetUsingPredicate:noNamePredicate] count];
}

@end
