//
//  B2DRayCastCallback.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RayCastCallback.h"

@class B2DFixture;

typedef float (^reportRaycastFixtureCallback)(B2DFixture *fixture, CGPoint point, CGPoint normal, CGFloat fraction);

@interface B2DRayCastCallback : NSObject {
  RayCastCallback *rayCastCallback;
  reportRaycastFixtureCallback reportFixture;
}

@property (nonatomic, assign) RayCastCallback *rayCastCallback;
@property (nonatomic, copy) reportRaycastFixtureCallback reportFixture;

@end
