//
//  B2DDraw.h
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DColor.h"
#import "B2DTransform.h"
#include "Draw.h"

typedef void (^drawPolygonCallback) (CGPoint *vertices, NSInteger vertexCount, B2DColor color);
typedef void (^drawSolidPolygonCallback) (CGPoint *vertices, NSInteger vertexCount, B2DColor color);
typedef void (^drawCircleCallback) (CGPoint center, float radius, B2DColor color);
typedef void (^drawSolidCircleCallback) (CGPoint center, float radius, B2DColor color);
typedef void (^drawSegmentCallback) (CGPoint point1, CGPoint point2, B2DColor color);
typedef void (^drawTransformCallback) (B2DTransform transform);


@interface B2DDraw : NSObject {
  Draw *draw;
  drawPolygonCallback drawPolygon;
  drawSolidPolygonCallback drawSolidPolygon;
  drawCircleCallback drawCircle;
  drawSolidCircleCallback drawSolidCircle;
  drawSegmentCallback drawSegment;
  drawTransformCallback drawTransform;
}

@property (nonatomic, assign) Draw *draw;
@property (nonatomic, copy) drawPolygonCallback drawPolygon;
@property (nonatomic, copy) drawSolidPolygonCallback drawSolidPolygon;
@property (nonatomic, copy) drawCircleCallback drawCircle;
@property (nonatomic, copy) drawSolidCircleCallback drawSolidCircle;
@property (nonatomic, copy) drawSegmentCallback drawSegment;
@property (nonatomic, copy) drawTransformCallback drawTransform;

@end
