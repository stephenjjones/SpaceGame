//
//  LevelManager.m
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import "LevelManager.h"

@implementation LevelManager

- (id)init {
    
    if ((self = [super init])) {
        _gameState = GameStateMainMenu;
    }
    return self;
}

@end
