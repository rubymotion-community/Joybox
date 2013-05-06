//
//  B2DContactListener.h
//  Box2D
//
//  Created by Juan Jose Karam on 3/6/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "ContactListener.h"

@class B2DBody;

typedef void (^beginContactCallback)(B2DBody *firstBody, B2DBody *secondBody, BOOL isTouching);
typedef void (^endContactCallback)(B2DBody *firstBody, B2DBody *secondBody);


@interface B2DContactListener : NSObject

@property (nonatomic, assign) ContactListener *contactListener;
@property (nonatomic, copy) beginContactCallback beginContact;
@property (nonatomic, copy) endContactCallback endContact;


@end
