//
//  ParallaxNode.m
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import "ParallaxNode.h"

@implementation ParallaxNode

- (id)initWithVelocity:(CGPoint)velocity
{
    if ((self = [super init])) {
        _velocity = velocity;
    }
    return self;
}

- (void)addChild:(SKSpriteNode *)node parallaxRatio:(float)parallaxRatio
{
    if (!node.userData) {
        node.userData = [NSMutableDictionary dictionary];
    }
    node.userData[@"ParallaxRatio"] = @(parallaxRatio);
    [super addChild:node];
}

- (void)update:(float)deltaTime {
    [self.children enumerateObjectsUsingBlock:^(SKSpriteNode * node, NSUInteger idx, BOOL *stop) {
        float parallaxRatio = [(NSNumber *)node.userData[@"ParallaxRatio"] floatValue];
        CGPoint childVelocity = CGPointMultiplyScalar(self.velocity, parallaxRatio);
        CGPoint offset = CGPointMultiplyScalar(childVelocity, deltaTime);
        node.position = CGPointAdd(node.position, offset);
    }];
}

@end
