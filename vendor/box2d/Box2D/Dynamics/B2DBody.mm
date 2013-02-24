//
//  CBBody.m
//  CBBox2D
//
//  Created by Juan Jose Karam on 2/17/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import "B2DBody.h"
#import "B2DEdgeShape.h"
#import "B2DPolygonShape.h"

@interface B2DBody ()

@property (nonatomic, assign) b2Body *body;

@end


@implementation B2DBody

@synthesize body;
@synthesize position;
@synthesize angle;

- (id)initWithBoxBody:(b2Body *)aBody
{
  self = [super init];
  
  if (self)
  {
    self.body = aBody;
  }
  
  return self;
}


- (CGPoint)position
{
  b2Vec2 actualPosition = self.body->GetPosition();
  
  return CGPointMake(actualPosition.x, actualPosition.y);
}


- (CGFloat)angle
{
  return self.body->GetAngle();
}


- (void)addFixureForEdgeShape:(B2DEdgeShape *)edgeShape
                     friction:(CGFloat)friction
                  restitution:(CGFloat)restitution
                      density:(CGFloat)density
                     isSensor:(BOOL)isSensor
{
  
  b2FixtureDef fixureDefinition;

  fixureDefinition.shape = &(const b2EdgeShape&)edgeShape.shape;
  fixureDefinition.friction = friction;
  fixureDefinition.restitution = restitution;
  fixureDefinition.density = density;
  fixureDefinition.isSensor = isSensor;
  body->CreateFixture(&fixureDefinition);
}


- (void)addFixureForPolygonShape:(B2DPolygonShape *)polygonShape
                        friction:(CGFloat)friction
                     restitution:(CGFloat)restitution
                         density:(CGFloat)density
                        isSensor:(BOOL)isSensor
{
  b2FixtureDef fixureDefinition;
  
  fixureDefinition.shape = &(const b2PolygonShape&)polygonShape.shape;
  fixureDefinition.friction = friction;
  fixureDefinition.restitution = restitution;
  fixureDefinition.density = density;
  fixureDefinition.isSensor = isSensor;
  body->CreateFixture(&fixureDefinition);
}

@end
