//
//  AlienLaser.m
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import "AlienLaser.h"

@implementation AlienLaser

- (instancetype)init
{
    if ((self = [super initWithImageNamed:@"laserbeam_red" maxHp:1 healthBarType:HealthBarTypeNone])) {
        [self setupCollisionBody];
    }
    return self;
}


- (void)setupCollisionBody
{
    CGPoint offset = CGPointMake(self.size.width * self.anchorPoint.x, self.size.height * self.anchorPoint.y);
    CGMutablePathRef path = CGPathCreateMutable();
    [self moveToPoint:CGPointMake(4, 8) path:path offset:offset];
    [self addLineToPoint:CGPointMake(24, 8) path:path offset:offset];
    [self addLineToPoint:CGPointMake(24, 3) path:path offset:offset];
    [self addLineToPoint:CGPointMake(4, 3) path:path offset:offset];
    CGPathCloseSubpath(path);
    
    self.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];
    [self attachDebugFrameFromPath:path color:[SKColor redColor]];
    self.physicsBody.categoryBitMask = EntityCategoryAlienLaser;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = EntityCategoryPlayer;
}

@end
