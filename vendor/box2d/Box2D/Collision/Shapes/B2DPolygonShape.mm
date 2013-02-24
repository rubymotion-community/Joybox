//
//  B2DPolygonShape.m
//  Box2D
//
//  Created by Juan Jose Karam on 2/18/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import "B2DPolygonShape.h"

@implementation B2DPolygonShape

@synthesize shape;

- (id)initWithBoxSize:(CGSize)boxSize
{
  self = [super init];
  
  if (self)
  {
    b2PolygonShape polygonShape;
    polygonShape.SetAsBox(boxSize.width, boxSize.height);
    
    self.shape = polygonShape;
  }
  
  return self;
}

@end
