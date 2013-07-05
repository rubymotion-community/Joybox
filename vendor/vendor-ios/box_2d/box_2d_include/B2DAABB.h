//
//  B2DAABB.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DAABB : NSObject {
  CGPoint lowerBound;
  CGPoint upperBound;
}

@property (nonatomic, assign) CGPoint lowerBound;
@property (nonatomic, assign) CGPoint upperBound;

- (id)initWithAABB:(b2AABB)aabb;

@end