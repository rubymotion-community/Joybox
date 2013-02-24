//
//  B2DEdgeShape.h
//  Box2D
//
//  Created by Juan Jose Karam on 2/19/13.
//  Copyright (c) 2013 CurveBeryl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DEdgeShape : NSObject

@property (nonatomic, assign) b2EdgeShape shape;

- (id)initWithStartPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint;

@end
