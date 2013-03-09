//
//  CBWorld.h
//  CBBox2D
//
//  Created by Juan Jose Karam on 2/17/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class B2DBody;
@class B2DContactListener;

typedef enum {
  
  kStaticBodyType = 0,
  kKinematicBodyType = 1,
  kDynamicBodyType = 2
  
} B2DBodyTypes;

@interface B2DWorld : NSObject

@property (nonatomic, assign) b2World *world;
@property (nonatomic, getter = gravity, setter = setGravity:) CGPoint gravity;
@property (nonatomic, getter = continuosPhysics, setter = setContinuosPhysics:) BOOL continuosPhysics;
@property (nonatomic, getter = allowsSleeping, setter = setAllowsSleeping:) BOOL allowsSleeping;

- (void)stepWithDelta:(CGFloat)delta
 velocityInteractions:(int)velocityInteractions
 positionInteractions:(int)positionInteractions;

- (B2DBody *)createBodyInPosition:(CGPoint)position
                             type:(B2DBodyTypes)bodyType;

- (void)removeBody:(B2DBody *)body;

- (void)addContactListener:(B2DContactListener *)contactListener;


@end
