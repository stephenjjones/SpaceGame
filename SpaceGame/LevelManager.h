//
//  LevelManager.h
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GameState) {
    GameStateMainMenu = 0,
    GameStatePlay,
    GameStateDone,
    GameStateGameOver
};

@interface LevelManager : NSObject

@property (assign) GameState gameState;

@end
