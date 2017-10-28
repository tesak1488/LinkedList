//
//  Queue.h
//  Linked list
//
//  Created by Kovalev_A on 28.10.17.
//  Copyright © 2017 Kovalev_A. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue<__covariant QueueObject> : NSObject

- (NSUInteger)count;
- (_Nullable QueueObject)peek;
- (_Nullable QueueObject)dequeue;
- (BOOL)enqueue:(_Nonnull QueueObject)object ;

@end
