//
//  B2DColor.h
//  Box2D
//
//  Created by Juan José Karam on 7/4/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DColor : NSObject {
  Float32 red;
  Float32 green;
  Float32 blue;
}

@property (nonatomic, assign) Float32 red;
@property (nonatomic, assign) Float32 green;
@property (nonatomic, assign) Float32 blue;

- (id)initWithColor:(b2Color)color;

@end
