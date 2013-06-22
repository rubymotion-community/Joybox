//
//  B2DFixtureDef.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DFixtureDef_h
#define Box2D_B2DFixtureDef_h

@class B2DShape;

struct B2DFixtureDef
{
  B2DShape *shape;
  id userData;
  CGFloat friction;
  CGFloat restitution;
  CGFloat density;
  BOOL isSensor;
};
typedef struct B2DFixtureDef B2DFixtureDef;

B2DFixtureDef B2DFixtureDefMake();

#endif
