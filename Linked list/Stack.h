//
//  Stack.h
//  Linked list
//
//  Created by Kovalev_A on 28.10.17.
//  Copyright © 2017 Kovalev_A. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack<__covariant StackObject> : NSObject

- (_Nullable StackObject)peek;
- (NSUInteger)count;
- (BOOL)push:(_Nonnull StackObject)object;
- (_Nullable StackObject)pop;

@end
