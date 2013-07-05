//
//  B2DTransform.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DTransform : NSObject {
  CGPoint point;
  Float32 angle;
}

@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) Float32 angle;

- (id)initWithTransform:(b2Transform)transform;

@end