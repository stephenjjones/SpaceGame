//
//  Player.m
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    if ((self = [super initWithImageNamed:@"SpaceFlier_sm_1" maxHp:10])) {
        [self setupAnimation];
        [self setupCollisionBody];
    }
    return self;
}

- (void)setupAnimation
{
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"SpaceFlier_sm_1"],
                          [SKTexture textureWithImageNamed:@"SpaceFlier_sm_2"],
                          ];
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.2];
    [self runAction:[SKAction repeatActionForever:animation]];
}

- (void)setupCollisionBody
{
    // 1
    CGPoint offset = CGPointMake(self.size.width * self.anchorPoint.x, self.size.height * self.anchorPoint.y);
    CGMutablePathRef path = CGPathCreateMutable();
    [self moveToPoint:CGPointMake(70, 51) path:path offset:offset];
    [self addLineToPoint:CGPointMake(83, 50) path:path offset:offset];
    [self addLineToPoint:CGPointMake(102, 32) path:path offset:offset];
    [self addLineToPoint:CGPointMake(95, 16) path:path offset:offset];
    [self addLineToPoint:CGPointMake(73, 9) path:path offset:offset];
    [self addLineToPoint:CGPointMake(45, 16) path:path offset:offset];
    [self addLineToPoint:CGPointMake(46, 36) path:path offset:offset];
    CGPathCloseSubpath(path);
    self.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];

    [self attachDebugFrameFromPath:path color:[SKColor redColor]];
    
    self.physicsBody.categoryBitMask = EntityCategoryPlayer;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = EntityCategoryAsteroid |
        EntityCategoryAlienLaser | EntityCategoryPowerup | EntityCategoryAlien;
}

@end
