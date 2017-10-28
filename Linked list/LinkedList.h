//
//  LinkedList.h
//  Linked list
//
//  Created by Kovalev_A on 21.10.17.
//  Copyright © 2017 Kovalev_A. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedList <__covariant LinkedListNode> : NSObject

@property (nonatomic, readonly) NSUInteger count;

- (BOOL)insertObject:(LinkedListNode)object afterIndex:(NSUInteger)index;
- (BOOL)insertObjectInHead:(LinkedListNode)object;
- (BOOL)deleteObject:(LinkedListNode)object;
- (NSUInteger)findObject:(LinkedListNode)object;
- (LinkedListNode)objectAtIndex:(NSUInteger)index;

@end
