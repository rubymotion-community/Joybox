//
//  CBWorld.h
//  CBBox2D
//
//  Created by Juan Jose Karam on 2/17/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DBodyTypes.h"
#import "B2DBodyDef.h"
#import "B2DProfile.h"
#import "B2DAABB.h"

@class B2DBody;
@class B2DContactListener;
@class B2DContactFilter;
@class B2DDestructionListener;
@class B2DQueryCallback;
@class B2DRayCastCallback;

@interface B2DWorld : NSObject {
  
  b2World *world;
}

@property (nonatomic, assign) b2World *world;
@property (nonatomic, assign, readonly) NSArray *bodyList;
@property (nonatomic, assign) BOOL allowsSleeping;
@property (nonatomic, assign, readonly) NSInteger proxyCount;
@property (nonatomic, assign, readonly) NSInteger bodyCount;
@property (nonatomic, assign, readonly) NSInteger jointCount;
@property (nonatomic, assign, readonly) NSInteger contactCount;
@property (nonatomic, assign, readonly) NSInteger treeHeight;
@property (nonatomic, assign, readonly) NSInteger treeBalance;
@property (nonatomic, assign, readonly) NSInteger treeQuality;
@property (nonatomic, assign) CGPoint gravity;
@property (nonatomic, assign, readonly) BOOL isLocked;
@property (nonatomic, assign) BOOL autoClearForces;
@property (nonatomic, assign, readonly) B2DProfile profile;

- (id)initWithWorld:(b2World *)boxWorld;

- (void)setContactListener:(B2DContactListener *)contactListener;
- (void)setContactFilter:(B2DContactFilter *)contactFilter;
- (void)setDestructionListener:(B2DDestructionListener *)destructionListener;
- (B2DBody *)createBody:(B2DBodyDef)bodyDefinition;
- (void)destroyBody:(B2DBody *)body;
- (void)stepWithDelta:(CGFloat)delta velocityInteractions:(int)velocityInteractions positionInteractions:(int)positionInteractions;
- (void)clearForces;
- (void)queryAABBWithCallback:(B2DQueryCallback *)queryCallback andAABB:(B2DAABB)aabb;
- (void)rayCastWithCallback:(B2DRayCastCallback *)rayCastCallback andPoint1:(CGPoint)point1 andPoint2:(CGPoint)point2;
- (void)dump;

#pragma mark - Deprecated

@property (nonatomic, assign) BOOL continuousPhysics;

- (void)addContactListener:(B2DContactListener *)contactListener __attribute__ ((deprecated));
- (B2DBody *)createBodyInPosition:(CGPoint)position type:(B2DBodyTypes)bodyType __attribute__ ((deprecated));
- (void)removeBody:(B2DBody *)body __attribute__ ((deprecated));

@end
