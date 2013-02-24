//
//  CBBody.h
//  CBBox2D
//
//  Created by Juan Jose Karam on 2/17/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class B2DEdgeShape;
@class B2DPolygonShape;

@interface B2DBody : NSObject

@property (nonatomic, readonly, getter = position) CGPoint position;
@property (nonatomic, readonly, getter = angle) CGFloat angle;

- (id)initWithBoxBody:(b2Body *)boxBody;

- (void)addFixureForEdgeShape:(B2DEdgeShape *)edgeShape
                     friction:(CGFloat)friction
                  restitution:(CGFloat)restitution
                      density:(CGFloat)density
                     isSensor:(BOOL)isSensor;

- (void)addFixureForPolygonShape:(B2DPolygonShape *)polygonShape
                        friction:(CGFloat)friction
                     restitution:(CGFloat)restitution
                         density:(CGFloat)density
                        isSensor:(BOOL)isSensor;

@end
