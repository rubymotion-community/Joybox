//
//  B2DDestructionListener.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/15/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DestructionListener.h"

@class B2DFixture;

typedef void (^fixtureSayGoodbyeCallback)(B2DFixture *fixture);

@interface B2DDestructionListener : NSObject {
  DestructionListener *destructionListener;
  fixtureSayGoodbyeCallback fixtureSayGoodbye;
}

@property (nonatomic, assign) DestructionListener *destructionListener;
@property (nonatomic, copy) fixtureSayGoodbyeCallback fixtureSayGoodbye;

@end
