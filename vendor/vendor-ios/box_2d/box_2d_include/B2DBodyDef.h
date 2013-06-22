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

typedef struct _B2DBodyDef
{
  B2DBodyTypes type;
  CGPoint position;
  CGFloat angle;
  CGPoint linearVelocity;
  CGFloat angularVelocity;
  CGFloat linearDamping;
  CGFloat angularDamping;
  BOOL allowSleep;
  BOOL awake;
  BOOL fixedRotation;
  BOOL bullet;
  BOOL active;
  CGFloat gravityScale;
} B2DBodyDef;
//typedef struct B2DBodyDef B2DBodyDef;

static inline B2DBodyDef B2DBodyDefMake()
{
  B2DBodyDef bodyDefinition;
  bodyDefinition.position = CGPointMake(0.0f, 0.0f);
  bodyDefinition.angle = 0.0f;
  bodyDefinition.linearVelocity = CGPointMake(0.0f, 0.0f);
  bodyDefinition.angularVelocity = 0.0f;
  bodyDefinition.linearDamping = 0.0f;
  bodyDefinition.angularDamping = 0.0f;
  bodyDefinition.allowSleep = true;
  bodyDefinition.awake = true;
  bodyDefinition.fixedRotation = false;
  bodyDefinition.bullet = false;
  bodyDefinition.type = kStaticBodyType;
  bodyDefinition.active = true;
  bodyDefinition.gravityScale = 1.0f;
  
  return bodyDefinition;
}
#endif