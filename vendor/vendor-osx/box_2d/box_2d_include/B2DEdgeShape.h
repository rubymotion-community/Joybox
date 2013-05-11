//
//  B2DEdgeShape.h
//  Box2D
//
//  Created by Juan Jose Karam on 2/19/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DShape.h"

@interface B2DEdgeShape : B2DShape

- (id)initWithStartPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint;

@end
