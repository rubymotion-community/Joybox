//
//  B2DRayCastOutput.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DRayCastOutput : NSObject {
  CGPoint normal;
  Float32 fraction;
}

@property (nonatomic, assign) CGPoint normal;
@property (nonatomic, assign) Float32 fraction;

- (id)initWithRayCastOutput:(b2RayCastOutput)rayCastOutput;

@end