//
//  B2DEdgeShape.h
//  Box2D
//
//  Created by Juan Jose Karam on 2/19/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DShape.h"

@interface B2DEdgeShape : B2DShape

@property (nonatomic, assign, readonly) CGPoint startVertex;
@property (nonatomic, assign, readonly) CGPoint endVertex;
@property (nonatomic, assign, readonly) bool hasStartAdjacentVertex;
@property (nonatomic, assign, readonly) CGPoint startAdjacentVertex;
@property (nonatomic, assign, readonly) bool hasEndAdjacentVertex;
@property (nonatomic, assign, readonly) CGPoint endAdjacentVertex;

- (id)initWithStartVertex:(CGPoint)startVertex endVertex:(CGPoint)endVertex;


#pragma mark - Deprecated

- (id)initWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint __attribute__ ((deprecated));

@end
