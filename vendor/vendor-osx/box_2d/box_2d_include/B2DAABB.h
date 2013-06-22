//
//  B2DAABB.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DAABB_h
#define Box2D_B2DAABB_h

struct B2DAABB
{
  CGPoint lowerBound;
  CGPoint upperBound;
};
typedef struct B2DAABB B2DAABB;

B2DAABB B2DAABBMake(CGPoint lowerBound, CGPoint upperBound);

#endif
