//
//  LinkedList.m
//  Linked list
//
//  Created by Kovalev_A on 21.10.17.
//  Copyright © 2017 Kovalev_A. All rights reserved.
//

#import "LinkedList.h"

/*--- NODE ---*/

@interface LinkedListNode : NSObject

@property (nonatomic, strong, readonly) id<NSObject> object;
@property (nonatomic, strong) LinkedListNode *next;

+ (instancetype)nodeWithObject:(id<NSObject>)object next:(LinkedListNode *)next;
- (instancetype)initWithObject:(id<NSObject>)object next:(LinkedListNode *)next;

@end

@interface LinkedListNode ()

@property (nonatomic, strong, readwrite) id<NSObject> object;

@end

@implementation LinkedListNode

+ (instancetype)nodeWithObject:(id)object next:(LinkedListNode *)next
{
    return [[self alloc] initWithObject:object next:next];
}

- (instancetype)initWithObject:(id)object next:(LinkedListNode *)next
{
    self = [self init];
    if (self) {
        self.object = object;
        self.next = next;
    }
    return self;
}

@end

/*--- List ---*/

#define checkObject(object)    \
if (!object) { \
NSAssert(NO, @"object can not be nil"); \
return NO; \
}

@interface LinkedList ()

@property (nonatomic, strong) LinkedListNode *head;
@property (nonatomic, readwrite) NSUInteger count;

@end

@implementation LinkedList

- (BOOL)insertObjectInHead:(id)object
{
    checkObject(object);
    self.head = [LinkedListNode nodeWithObject:object next:self.head];
    ++self.count;
    return YES;
}

- (BOOL)insertObject:(id)object afterIndex:(NSUInteger)index
{
    checkObject(object);
    LinkedListNode *nodeAtIndex = [self nodeAtIndex:index];
    if (nodeAtIndex ) {
        [self insertNode:[LinkedListNode nodeWithObject:object next:nil] afterNode:nodeAtIndex];
        return YES;
    }
    return NO;
}

- (BOOL)deleteObject:(id)object
{
    checkObject(object);
    if ([self.head.object isEqual:object]) {
        return [self removeCurrentHead];
    } else {
        return [self removeNodeWithObject:object];
    }
}

- (NSUInteger)findObject:(id)object
{
    checkObject(object);
    NSUInteger counter = 0;
    LinkedListNode *currentNode = self.head;
    while (currentNode) {
        if ([currentNode.object isEqual:object]) {
            return counter;
        } else {
            ++counter;
            currentNode = currentNode.next;
        }
    }
    return NSNotFound;
}

- (BOOL)removeCurrentHead
{
    self.head = self.head.next;
    --self.count;
    return YES;
}

- (BOOL)removeNodeWithObject:(id)object
{
    LinkedListNode *prevNode = [self previosNodeForNodeWithObject:object];
    if (prevNode) {
        prevNode.next = prevNode.next.next;
        --self.count;
        return YES;
    }
    return NO;
}

- (LinkedListNode *)previosNodeForNodeWithObject:(id)object
{
    LinkedListNode *currentNode = self.head;
    while (currentNode) {
        if ([currentNode.next.object isEqual:object]) {
            return currentNode;
        } else {
            currentNode = currentNode.next;
        }
    }
    return nil;
}

- (LinkedListNode *)nodeAtIndex:(NSInteger)index
{
    if (index >= self.count) {
        return nil;
    }
    LinkedListNode *result = self.head;
    while (index != 0)
    {
        result = result.next;
        --index;
    }
    return result;
}

- (void)insertNode:(LinkedListNode *)node afterNode:(LinkedListNode *)prevNode
{
    LinkedListNode *nextNode = prevNode.next;
    prevNode.next = node;
    node.next = nextNode;
    ++self.count;
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [self nodeAtIndex:index].object;
}

@end
