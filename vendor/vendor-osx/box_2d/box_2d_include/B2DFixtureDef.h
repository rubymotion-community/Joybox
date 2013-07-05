//
//  B2DFixtureDef.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@class B2DShape;

@interface B2DFixtureDef : NSObject {
  B2DShape *shape;
  id userData;
  CGFloat friction;
  CGFloat restitution;
  CGFloat density;
  bool isSensor;
}

@property (nonatomic, assign) B2DShape *shape;
@property (nonatomic, assign) id userData;
@property (nonatomic, assign) CGFloat friction;
@property (nonatomic, assign) CGFloat restitution;
@property (nonatomic, assign) CGFloat density;
@property (nonatomic, assign) bool isSensor;

@end