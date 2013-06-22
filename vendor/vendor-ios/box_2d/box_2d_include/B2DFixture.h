//
//  B2DFixture.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DShapeTypes.h"
#import "B2DFilter.h"
#import "B2DRayCastOutput.h"
#import "B2DRayCastInput.h"
#import "B2DAABB.h"
#import "B2DMassData.h"

@class B2DBody;
@class B2DShape;

@interface B2DFixture : NSObject {
  
  b2Fixture *fixture;
}

@property (nonatomic, assign) b2Fixture *fixture;
@property (nonatomic, assign, readonly) B2DShapeTypes type;
@property (nonatomic, assign, readonly) B2DShape *shape;
@property (nonatomic, assign, readonly) BOOL isSensor;
@property (nonatomic, assign) BOOL sensor;
@property (nonatomic, assign) B2DFilter filterData;
@property (nonatomic, assign, readonly) B2DBody *body;
@property (nonatomic, assign) id userData;
@property (nonatomic, assign) CGFloat density;
@property (nonatomic, assign) CGFloat friction;
@property (nonatomic, assign) CGFloat restitution;


- (id)initWithFixture:(b2Fixture *)boxFixture;
- (void)refilter;
- (B2DFixture *)next;
- (BOOL)testPoint:(CGPoint)point;
- (BOOL)rayCastWithOutput:(B2DRayCastOutput *)output input:(B2DRayCastInput)input andChildIndex:(NSInteger)childIndex;
- (B2DMassData)massData;
- (B2DAABB)aabb:(NSInteger)childIndex;
- (void)dump:(NSInteger)bodyIndex;

@end
