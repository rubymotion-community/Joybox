//
//  B2DColor.h
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DColor_h
#define Box2D_B2DColor_h

struct B2DColor
{
  CGFloat red;
  CGFloat green;
  CGFloat blue;
};
typedef struct B2DColor B2DColor;

B2DColor B2DColorMake(CGFloat red, CGFloat green, CGFloat blue);

#endif