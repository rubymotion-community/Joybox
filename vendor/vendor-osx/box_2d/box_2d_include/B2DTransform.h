//
//  B2DTransform.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DTransform_h
#define Box2D_B2DTransform_h

struct B2DTransform
{
  CGPoint position;
  CGFloat angle;
};
typedef struct B2DTransform B2DTransform;

B2DTransform B2DTransformMake(CGPoint position, CGFloat angle);

#endif