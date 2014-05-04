//
//  Asteroid.h
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import "Entity.h"

typedef NS_ENUM(NSInteger, AsteroidType) {
    AsteroidTypeSmall = 0,
    AsteroidTypeMedium,
    AsteroidTypeLarge,
    NumAsteroidTypes
};

@interface Asteroid : Entity

@property (assign) AsteroidType asteroidType;

- (instancetype)initWithAsteroidType:(AsteroidType)asteroidType;

@end
