//
//  B2DDraw.h
//  Box2D
//
//  Created by Juan José Karam on 6/29/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Draw.h"

@class B2DColor;
@class B2DTransform;

typedef enum {
  
  kShapeDrawFlag = 0x0001,
  kJointDrawFlag = 0x0002,
  kAABBDrawFlag = 0x0004,
  kPairDrawFlag = 0x0008,
  kCenterOfMassDrawFlag = 0x0010
  
} B2DDrawingFlags;

typedef void (^drawPolygonCallback) (CGPoint *vertices, NSInteger vertexCount, B2DColor *color);
typedef void (^drawSolidPolygonCallback) (CGPoint *vertices, NSInteger vertexCount, B2DColor *color);
typedef void (^drawCircleCallback) (CGPoint center, float radius, B2DColor *color);
typedef void (^drawSolidCircleCallback) (CGPoint center, float radius, CGPoint axis, B2DColor *color);
typedef void (^drawSegmentCallback) (CGPoint point1, CGPoint point2, B2DColor *color);
typedef void (^drawTransformCallback) (B2DTransform *transform);

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
@property (nonatomic, assign) unsigned int drawFlags;
@property (nonatomic, copy) drawPolygonCallback drawPolygon;
@property (nonatomic, copy) drawSolidPolygonCallback drawSolidPolygon;
@property (nonatomic, copy) drawCircleCallback drawCircle;
@property (nonatomic, copy) drawSolidCircleCallback drawSolidCircle;
@property (nonatomic, copy) drawSegmentCallback drawSegment;
@property (nonatomic, copy) drawTransformCallback drawTransform;

- (void)appendDrawFlags:(unsigned int)flags;
- (void)clearDrawFlags:(unsigned int)flags;

@end
