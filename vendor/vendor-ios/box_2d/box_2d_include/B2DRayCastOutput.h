//
//  B2DRayCastOutput.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DRayCastOutput_h
#define Box2D_B2DRayCastOutput_h

struct B2DRayCastOutput
{
  CGPoint normal;
  CGFloat fraction;
};
typedef struct B2DRayCastOutput B2DRayCastOutput;

B2DRayCastOutput B2DRayCastOutputMake(CGPoint normal, CGFloat fraction);

#endif
