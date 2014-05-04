//
//  ParallaxNode.h
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ParallaxNode : SKNode

@property (nonatomic, assign) CGPoint velocity;

- (id)initWithVelocity:(CGPoint)velocity;
- (void)addChild:(SKSpriteNode *)node parallaxRatio:(float)parallaxRatio;
- (void)update:(float)deltaTime;

@end
