//
//  Entity.m
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import "Entity.h"

@implementation Entity
{
    SKSpriteNode *_healthBarBg;
    SKSpriteNode *_healthBarProgress;
    CGFloat _fullWidth;
    CGFloat _displayedWidth;
}

- (instancetype)initWithImageNamed:(NSString *)name maxHp:(NSInteger)maxHp healthBarType:(HealthBarType)healthBarType
{
    if ((self = [super initWithImageNamed:name])) {
        _maxHp = maxHp;
        _hp = maxHp;
        _healthBarType = healthBarType;
        [self setupHealthBar];
    }
    return self;
}

- (void)setupHealthBar
{
    if (_healthBarType == HealthBarTypeNone) return;
    
    _healthBarBg = [SKSpriteNode spriteNodeWithImageNamed:@"healthbar_bg"];
    _healthBarBg.position = CGPointMake(0, self.size.height * 0.5);
    [self addChild:_healthBarBg];
    
    NSString * progressSpriteName;
    if (_healthBarType == HealthBarTypeGreen) {
        progressSpriteName = @"healthbar_green";
    } else {
            progressSpriteName = @"healthbar_red";
    }
    
    _healthBarProgress = [SKSpriteNode spriteNodeWithImageNamed:progressSpriteName];
    _healthBarProgress.anchorPoint = CGPointZero;
    _healthBarProgress.position = _healthBarBg.position;
    _healthBarProgress.position = CGPointMake(
                                              _healthBarBg.position.x - _healthBarProgress.size.width/2,
                                              _healthBarBg.position.y - _healthBarProgress.size.height/2);
    [self addChild:_healthBarProgress];
    
    _fullWidth = _healthBarBg.size.width;
    _displayedWidth = _fullWidth;
    
    _healthBarProgress.hidden = YES;
    _healthBarBg.hidden = YES;
}

- (void)moveToPoint:(CGPoint)point path:(CGMutablePathRef)path offset:(CGPoint)offset {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        CGPathMoveToPoint(path, NULL, point.x*2 - offset.x, point.y*2 - offset.y);
    } else {
        CGPathMoveToPoint(path, NULL, point.x - offset.x, point.y - offset.y);
    }
}

- (void)addLineToPoint:(CGPoint)point path:(CGMutablePathRef)path offset:(CGPoint)offset {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        CGPathAddLineToPoint(path, NULL, point.x*2 - offset.x, point.y*2 - offset.y);
    } else {
        CGPathAddLineToPoint(path, NULL, point.x - offset.x, point.y - offset.y);
    } }


- (void)collidedWith:(SKPhysicsBody *)body contact:(SKPhysicsContact*)contact {
// ovveride in subclasses for specific behavior
}

- (BOOL)isDead
{
    return _hp <= 0;
}

- (void)takeHit
{
    if (_hp > 0) {
        _hp--;
    }
    
    if ([self isDead]) {
        [self destroy];
    }
}

- (void)cleanup {
    [self removeFromParent];
}

- (void)destroy
{
    _hp = 0;
    self.physicsBody = nil;
    [self removeAllActions];
    [self runAction:
        [SKAction sequence:@[
                             [SKAction fadeAlphaTo:0 duration:0.2],
                             [SKAction performSelector:@selector(cleanup) onTarget:self]
                            ]]
     ];
}

- (void)update:(CFTimeInterval)deltaTime
{
    if (_healthBarType == HealthBarTypeNone) return;
    
    float percentage = (float) _hp / (float) _maxHp;
    percentage = MIN(percentage, 1.0);
    percentage = MAX(percentage, 0);
    float desiredWidth = _fullWidth * percentage;
    
    float POINTS_PER_SEC = 50;
    if (desiredWidth < _displayedWidth) {
        _displayedWidth = MAX(desiredWidth, _displayedWidth - POINTS_PER_SEC * deltaTime);
    } else {
            _displayedWidth = MIN(desiredWidth, _displayedWidth + POINTS_PER_SEC * deltaTime);
    }
    _healthBarProgress.size = CGSizeMake(_displayedWidth, _healthBarProgress.size.height);
    
    
    if (desiredWidth != _displayedWidth) {
        NSArray * sprites = @[_healthBarBg, _healthBarProgress];
        for (SKSpriteNode * sprite in sprites) {
            sprite.hidden = NO;
            [sprite removeAllActions];
            [sprite runAction: [SKAction sequence:@[
                                                    [SKAction fadeInWithDuration:0.25],
                                                    [SKAction waitForDuration:2.0],
                                                    [SKAction fadeOutWithDuration:0.25],
                                                    [SKAction runBlock:^{
                                                        sprite.hidden = YES;
                                                    }]
                                                    ]
                                ]
             ];
        }
    }
}
@end