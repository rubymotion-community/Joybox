//
//  B2DContactFilter.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactFilter.h"

@class B2DFixture;

typedef bool (^shouldCollideCallback)(B2DFixture *fixtureA, B2DFixture *fixtureB);

@interface B2DContactFilter : NSObject {
  ContactFilter *contactFilter;
  shouldCollideCallback shouldCollide;
}

@property (nonatomic, assign) ContactFilter *contactFilter;
@property (nonatomic, copy) shouldCollideCallback shouldCollide;

@end