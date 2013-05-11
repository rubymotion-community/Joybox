//
//  B2DShape.h
//  Box2D
//
//  Created by Juan Jose Karam on 3/6/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DShape : NSObject {
  
  b2Shape *shape;
}

@property (nonatomic, assign) b2Shape *shape;

@end
