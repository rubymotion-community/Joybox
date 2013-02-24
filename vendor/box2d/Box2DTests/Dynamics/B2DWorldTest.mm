//
//  CBWorldTest.m
//  CBBox2D
//
//  Created by Juan Jose Karam on 2/17/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import "B2DWorldTest.h"
#import "B2DBody.h"
#import "B2DPolygonShape.h"
#import "B2DEdgeShape.h"

@implementation B2DWorldTest

@synthesize world;

- (void)setUp
{
  self.world = [[B2DWorld alloc] init];
  
  [super setUp];
}


- (void)tearDown
{
  self.world = nil;
  
  [super tearDown];
}


- (void)testGravity
{
  CGPoint gravity = CGPointMake(5.0, 5.0);
  
  self.world.gravity = gravity;
  
  STAssertEquals(self.world.gravity.x, gravity.x, @"Gravity in X is not set in World");
  STAssertEquals(self.world.gravity.y, gravity.y, @"Gravity in Y is not set in World");
}


- (void)testContinuesPhysics
{
  BOOL continuosPhysics = true;
  
  self.world.continuosPhysics = continuosPhysics;
  
  STAssertEquals(self.world.continuosPhysics, continuosPhysics, @"Continous Physics is not set in World");
}


- (void)testAllowsSleeping
{
  BOOL allowsSleeping = true;
  
  self.world.allowsSleeping = allowsSleeping;
  
  STAssertEquals(self.world.allowsSleeping, allowsSleeping, @"Allows Sleeping is not set in World");
}


- (void)testStep
{
  self.world.gravity = CGPointMake(0.0, -10.f);
  
  B2DBody *body = [self.world createBodyInPosition:CGPointMake(5, 5)
                                              type:kDynamicBodyType];
  
  B2DPolygonShape *polygonShape = [[B2DPolygonShape alloc] initWithBoxSize:CGSizeMake(0.5, 0.5)];
  
  [body addFixureForPolygonShape:polygonShape
                 friction:0.3
              restitution:0.0
                  density:1.0
                 isSensor:NO];
  
  [self.world stepWithDelta:1 velocityInteractions:1 positionInteractions:8];
  
  STAssertFalse(5 == body.position.y, @"The test body is not moving into the world");
}


- (void)testCreateBody
{
  B2DBody *body = [self.world createBodyInPosition:CGPointMake(10, 10)
                                              type:kStaticBodyType];
 
  B2DEdgeShape *edgeShape = [[B2DEdgeShape alloc] initWithStartPoint:CGPointMake(5.0, 5.0)
                                                            endPoint:CGPointMake(5.0, 5.0)];
  
  [body addFixureForEdgeShape:edgeShape
                 friction:0.2
              restitution:0.0
                  density:0
                 isSensor:NO];
}
@end
