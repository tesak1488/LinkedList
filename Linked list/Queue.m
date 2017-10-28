//
//  Queue.m
//  Linked list
//
//  Created by Kovalev_A on 28.10.17.
//  Copyright © 2017 Kovalev_A. All rights reserved.
//

#import "LinkedList.h"
#import "Queue.h"

@interface Queue ()

@property (nonatomic, strong) LinkedList *list;

@end

@implementation Queue

- (LinkedList *)list
{
    if (!_list) {
        _list = [LinkedList new];
    }
    return _list;
}

- (BOOL)enqueue:(id)object
{
    if ([self count] == 0) {
        return [self.list insertObjectInHead:object];
    } else {
        return [self.list insertObject:object afterIndex:[self count] - 1];
    }
}

- (id)peek
{
    return [self.list objectAtIndex:0];
}

- (id)dequeue
{
    if ([self count] == 0) {
        return nil;
    } else {
        id peekObject = [self peek];
        [self.list deleteObject:peekObject];
        return peekObject;
    }
}

- (NSUInteger)count
{
    return self.list.count;
}

@end
