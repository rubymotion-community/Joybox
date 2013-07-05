//
//  B2DMassData.h
//  Box2D
//
//  Created by Juan Jose Karam on 6/8/13.
//  Copyright (c) 2013 Joybox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface B2DMassData : NSObject {
  Float32 mass;
  CGPoint centre;
  Float32 I;
}

@property (nonatomic, assign) Float32 mass;
@property (nonatomic, assign) CGPoint centre;
@property (nonatomic, assign) Float32 I;

- (id)initWithMassData:(b2MassData)massData;

@end