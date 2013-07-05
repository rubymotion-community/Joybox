//
//  B2DBodyDef.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DBodyTypes.h"

@interface B2DBodyDef : NSObject {
  B2DBodyTypes type;
  CGPoint position;
  CGFloat angle;
  CGPoint linearVelocity;
  CGFloat angularVelocity;
  CGFloat linearDamping;
  CGFloat angularDamping;
  bool allowSleep;
  bool awake;
  bool fixedRotation;
  bool bullet;
  bool active;
  CGFloat gravityScale;
}

@property (nonatomic, assign) B2DBodyTypes type;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) CGFloat angle;
@property (nonatomic, assign) CGPoint linearVelocity;
@property (nonatomic, assign) CGFloat angularVelocity;
@property (nonatomic, assign) CGFloat linearDamping;
@property (nonatomic, assign) CGFloat angularDamping;
@property (nonatomic, assign) bool allowSleep;
@property (nonatomic, assign) bool awake;
@property (nonatomic, assign) bool fixedRotation;
@property (nonatomic, assign) bool bullet;
@property (nonatomic, assign) bool active;
@property (nonatomic, assign) CGFloat gravityScale;

- (id)initWithBodyDef:(b2BodyDef)bodyDef;

@end