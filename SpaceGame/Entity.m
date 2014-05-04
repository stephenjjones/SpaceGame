//
//  Entity.m
//  SpaceGame
//
//  Created by Stephen Jones on 5/4/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import "Entity.h"

@implementation Entity

- (instancetype)initWithImageNamed:(NSString *)name maxHp:(NSInteger)maxHp
{
    if ((self = [super initWithImageNamed:name])) {
        _maxHp = maxHp;
        _hp = maxHp;
    }
    return self;
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

@end