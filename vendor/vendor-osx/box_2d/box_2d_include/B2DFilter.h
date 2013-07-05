//
//  B2DFilter.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DFilter : NSObject {
  NSUInteger categoryBits;
  NSUInteger maskBits;
  NSInteger groupIndex;
}

@property (nonatomic, assign) NSUInteger categoryBits;
@property (nonatomic, assign) NSUInteger maskBits;
@property (nonatomic, assign) NSInteger groupIndex;

- (id)initWithFilter:(b2Filter)filter;

@end