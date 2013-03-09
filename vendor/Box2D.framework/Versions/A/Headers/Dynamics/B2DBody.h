//
//  CBBody.h
//  CBBox2D
//
//  Created by Juan Jose Karam on 2/17/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//
//  Inspired by:
//
//  Thanks to Axcho for his beautiful Cocos2D-Box2D implementation
//  CCBox2D (https://github.com/axcho/CCBox2D)


#import <Foundation/Foundation.h>

@class B2DShape;

@interface B2DBody : NSObject

@property (nonatomic, assign) b2Body *body;
@property (nonatomic, readonly, getter = position) CGPoint position;
@property (nonatomic, readonly, getter = angle) CGFloat angle;
@property (nonatomic, readonly, getter = center) CGPoint center;
@property (nonatomic, getter = isSleepingAllowed, setter = setSleepingAllowed:) BOOL isSleepingAllowed;


- (id)initWithBody:(b2Body *)boxBody;

- (void)addFixureForShape:(B2DShape *)shape
                 friction:(CGFloat)friction
              restitution:(CGFloat)restitution
                  density:(CGFloat)density
                 isSensor:(BOOL)isSensor;

- (void)applyForce:(CGPoint)force
        atLocation:(CGPoint)location
         asImpulse:(BOOL)asImpulse;


- (void)applyTorque:(CGFloat)torque
          asImpulse:(BOOL)impulse;

@end
