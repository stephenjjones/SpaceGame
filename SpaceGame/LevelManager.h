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

- (NSInteger)curLevelIdx; - (void)nextStage;
- (void)nextLevel;
- (BOOL)update;
- (float)floatForProp:(NSString *)prop;
- (NSString *)stringForProp:(NSString *)prop;
- (BOOL)boolForProp:(NSString *)prop;
- (BOOL)hasProp:(NSString *)prop;

@end
