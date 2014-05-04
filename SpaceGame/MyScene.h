//
//  MyScene.h
//  SpaceGame
//

//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class Player;

@interface MyScene : SKScene

@property (strong) Player *player;

- (void)playExplosionLargeSound;
- (void)spawnExplosionAtPosition:(CGPoint)position scale:(float)scale large:(BOOL)large;

- (void)endScene:(BOOL)win;

- (void)spawnAlienLaserAtPosition:(CGPoint)position;


- (void)applyPowerup;

@end
