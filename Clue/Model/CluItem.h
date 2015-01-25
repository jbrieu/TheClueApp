//
//  CluItem.h
//  Clue
//
//  Created by Jean-Baptiste Rieu on 25/01/2015.
//  Copyright (c) 2015 jbrieu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CluItem;

@interface CluItem : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * imageName;
@property (nonatomic, retain) NSSet *children;
@property (nonatomic, retain) CluItem *parent;
@end

@interface CluItem (CoreDataGeneratedAccessors)

- (void)addChildrenObject:(CluItem *)value;
- (void)removeChildrenObject:(CluItem *)value;
- (void)addChildren:(NSSet *)values;
- (void)removeChildren:(NSSet *)values;

@end
