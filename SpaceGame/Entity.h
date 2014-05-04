//
//  Entity.h
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


typedef NS_OPTIONS(NSInteger, EntityCategory) {
    EntityCategoryPlayer    = 1 << 0,
    EntityCategoryAsteroid  = 1 << 1,
    EntityCategoryAlien     = 1 << 2,
    EntityCategoryPlayerLaser = 1 << 3,
    EntityCategoryAlienLaser = 1 << 4,
    EntityCategoryPowerup   = 1 << 5
};


@interface Entity : SKSpriteNode

@property (nonatomic, assign) NSInteger hp;
@property (nonatomic, assign) NSInteger maxHp;

- (instancetype)initWithImageNamed:(NSString *)name maxHp:(NSInteger)maxHp;

- (void)addLineToPoint:(CGPoint)point path:(CGMutablePathRef)path offset:(CGPoint)offset;
- (void)moveToPoint:(CGPoint)point path:(CGMutablePathRef)path offset:(CGPoint)offset;
- (void)collidedWith:(SKPhysicsBody *)body contact:(SKPhysicsContact*)contact;

- (BOOL)isDead;
- (void)takeHit;
- (void)cleanup;
- (void)destroy;

@end
