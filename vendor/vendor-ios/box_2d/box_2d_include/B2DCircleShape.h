//
//  B2DCircleShape.h
//  Box2D
//
//  Created by Kenichi Yonekawa on 13/04/24.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B2DShape.h"

@interface B2DCircleShape : B2DShape

@property (nonatomic, assign, readonly) NSInteger vertexCount;
@property (nonatomic, assign, readonly) CGPoint position;

- (id)initWithRadius:(CGFloat)radius;

- (NSInteger)getSupport:(CGPoint)direction;
- (CGPoint)getSupportVertex:(CGPoint)direction;
- (CGPoint)getVertex:(NSInteger)index;

@end
