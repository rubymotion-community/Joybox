//
//  B2DFilter.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DFilter_h
#define Box2D_B2DFilter_h

struct B2DFilter
{  
  NSUInteger categoryBits;
  NSUInteger maskBits;
  NSInteger groupIndex;
};
typedef struct B2DFilter B2DFilter;

B2DFilter B2DFilterMake();
B2DFilter B2DFilterMake(NSUInteger categoryBits, NSUInteger maskBits, NSInteger groupIndex);

#endif