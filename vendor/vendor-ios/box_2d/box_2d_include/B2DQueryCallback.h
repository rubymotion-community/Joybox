//
//  B2DQueryCallback.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QueryCallback.h"

@class B2DFixture;

typedef bool (^reportQueryFixtureCallback)(B2DFixture *fixture);

@interface B2DQueryCallback : NSObject {
  QueryCallback *queryCallback;
  reportQueryFixtureCallback reportFixture;
}

@property (nonatomic, assign) QueryCallback *queryCallback;
@property (nonatomic, copy) reportQueryFixtureCallback reportFixture;

@end
