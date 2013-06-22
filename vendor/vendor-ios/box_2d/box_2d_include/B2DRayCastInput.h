//
//  B2DRayCastInput.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DRayCastInput_h
#define Box2D_B2DRayCastInput_h

struct B2DRayCastInput
{
  CGPoint point1;
  CGPoint point2;
  CGFloat maxFraction;
};
typedef struct B2DRayCastInput B2DRayCastInput;

B2DRayCastInput B2DRayCastInputMake(CGPoint point1, CGPoint point2, CGFloat maxFraction);

#endif