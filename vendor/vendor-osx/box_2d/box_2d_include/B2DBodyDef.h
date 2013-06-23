//
//  B2DBodyDef.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DBodyDef_h
#define Box2D_B2DBodyDef_h

#import "B2DBodyTypes.h"

struct B2DBodyDef
{
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
};
typedef struct B2DBodyDef B2DBodyDef;

B2DBodyDef B2DBodyDefMake();

#endif