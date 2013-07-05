//
//  B2DProfile.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DProfile : NSObject {
  CGFloat step;
  CGFloat collide;
  CGFloat solve;
  CGFloat solveInit;
  CGFloat solveVelocity;
  CGFloat solvePosition;
  CGFloat broadphase;
  CGFloat solveTOI;
}

@property (nonatomic, assign) CGFloat step;
@property (nonatomic, assign) CGFloat collide;
@property (nonatomic, assign) CGFloat solve;
@property (nonatomic, assign) CGFloat solveInit;
@property (nonatomic, assign) CGFloat solveVelocity;
@property (nonatomic, assign) CGFloat solvePosition;
@property (nonatomic, assign) CGFloat broadphase;
@property (nonatomic, assign) CGFloat solveTOI;

@end