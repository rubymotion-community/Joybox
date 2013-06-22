//
//  B2DMassData.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#ifndef Box2D_B2DMassData_h
#define Box2D_B2DMassData_h

struct B2DMassData
{
  CGFloat mass;
  CGPoint center;
  CGFloat rotationalInertia;
};
typedef struct B2DMassData B2DMassData;

B2DMassData B2DMassDataMake(CGFloat mass, CGPoint center, CGFloat rotationalInertia);

#endif
