//
//  B2DPolygonShape.h
//  Box2D
//
//  Created by Juan Jose Karam on 2/18/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DShape.h"

@interface B2DPolygonShape : B2DShape

@property (nonatomic, assign, readonly) NSInteger vertexCount;
@property (nonatomic, assign, readonly) CGPoint centroid;
@property (nonatomic, assign, readonly) CGPoint *vertices;
@property (nonatomic, assign, readonly) CGPoint *normals;

- (id)initWithVertices:(CGPoint *)vertices andVertexCount:(NSInteger)vertexCount;
- (id)initWithHalfWidth:(CGFloat)halfWidth andHalfHeight:(CGFloat)halfHeight;
- (id)initWithHalfWidth:(CGFloat)halfWidth halfHeight:(CGFloat)halfHeight center:(CGPoint)center andAngle:(CGFloat)angle;

- (CGPoint)getVertex:(NSInteger)index;

#pragma mark - Deprecated

- (id)initWithBoxSize:(CGSize)boxSize __attribute__ ((deprecated));

@end
