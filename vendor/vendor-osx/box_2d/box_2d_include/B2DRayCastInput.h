//
//  B2DRayCastInput.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DRayCastInput : NSObject {
  CGPoint point1;
  CGPoint point2;
  Float32 maxFraction;
}

@property (nonatomic, assign) CGPoint point1;
@property (nonatomic, assign) CGPoint point2;
@property (nonatomic, assign) Float32 maxFraction;

- (id)initWithRayCastInput:(b2RayCastInput)rayCastInput;

@end