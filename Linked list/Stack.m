//
//  Stack.m
//  Linked list
//
//  Created by Kovalev_A on 28.10.17.
//  Copyright © 2017 Kovalev_A. All rights reserved.
//

#import "LinkedList.h"
#import "Stack.h"

@interface Stack ()

@property (nonatomic, strong) LinkedList *list;

@end

@implementation Stack

- (LinkedList *)list
{
    if (!_list) {
        _list = [LinkedList new];
    }
    return _list;
}

- (_Nullable id)peek
{
    if ([self count] == 0){
        return nil;
    } else {
        return [self.list objectAtIndex:0];
    }
}

- (BOOL)push:(id)object
{
    return [self.list insertObjectInHead:object];
}

- (_Nullable id)pop
{
    id topObject = [self peek];
    if (!topObject) {
        return nil;
    } else {
        [self.list deleteObject:topObject];
        return topObject;
    }
}

- (NSUInteger)count
{
    return self.list.count;
}

@end
