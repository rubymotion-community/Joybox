//
//  B2DChainShape.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DShape.h"

@class B2DEdgeShape;

@interface B2DChainShape : B2DShape

@property (nonatomic, assign, readonly) NSInteger vertexCount;
@property (nonatomic, assign, readonly) CGPoint *vertices;
@property (nonatomic, assign, readonly) bool hasPreviousVertex;
@property (nonatomic, assign, readonly) bool hasNextVertex;

- (void)createLoopWithVertices:(CGPoint *)vertices andVertexCount:(NSInteger)vertexCount;
- (void)createChainWithVertices:(CGPoint *)vertices andVertexCount:(NSInteger)vertexCount;
- (CGPoint)previousVertex;
- (void)setPreviousVertex:(CGPoint)vertex;
- (CGPoint)nextVertex;
- (void)setNextVertex:(CGPoint)vertex;
- (void)getChildEdge:(B2DEdgeShape *)edgeShape withIndex:(NSInteger)index;

@end
