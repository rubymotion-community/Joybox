//
//  B2DEdgeShape.m
//  Box2D
//
//  Created by Juan Jose Karam on 2/19/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import "B2DEdgeShape.h"

@implementation B2DEdgeShape

@synthesize shape;

- (id)initWithStartPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
{
  self = [super init];
  
  if (self)
  {
    b2EdgeShape edgeShape;
    edgeShape.Set(b2Vec2(startPoint.x, startPoint.y),
                  b2Vec2(endPoint.x, endPoint.y));
    
    self.shape = edgeShape;
  }
  
  return self;
}

@end
