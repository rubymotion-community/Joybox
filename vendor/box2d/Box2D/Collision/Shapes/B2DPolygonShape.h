//
//  B2DPolygonShape.h
//  Box2D
//
//  Created by Juan Jose Karam on 2/18/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DPolygonShape : NSObject

@property (nonatomic, assign) b2PolygonShape shape;

- (id)initWithBoxSize:(CGSize)boxSize;

@end
