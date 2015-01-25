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
@property (nonatomic, retain) NSOrderedSet *children;
@property (nonatomic, retain) CluItem *parent;
@end

@interface CluItem (CoreDataGeneratedAccessors)

- (void)insertObject:(CluItem *)value inChildrenAtIndex:(NSUInteger)idx;
- (void)removeObjectFromChildrenAtIndex:(NSUInteger)idx;
- (void)insertChildren:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeChildrenAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInChildrenAtIndex:(NSUInteger)idx withObject:(CluItem *)value;
- (void)replaceChildrenAtIndexes:(NSIndexSet *)indexes withChildren:(NSArray *)values;
- (void)addChildrenObject:(CluItem *)value;
- (void)removeChildrenObject:(CluItem *)value;
- (void)addChildren:(NSOrderedSet *)values;
- (void)removeChildren:(NSOrderedSet *)values;
@end
