//
//  MyScene.m
//  SpaceGame
//
//  Created by Stephen Jones on 5/3/14.
//  Copyright (c) 2014 Bits N Grits. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene
{
    SKNode *_gameLayer;
    SKNode *_hudLayer;
    SKLabelNode *_titleLabel1;
    SKLabelNode *_titleLabel2;
    
    //sounds
    SKAction *_soundExplosionLarge;
    SKAction *_soundExplosionSmall;
    SKAction *_soundLaserEnemy;
    SKAction *_soundLaserShip;
    SKAction *_soundShake;
    SKAction *_soundPowerup;
    SKAction *_soundBoss;
    SKAction *_soundCannon;
    SKAction *_soundTitle;
}


-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor blackColor];
        
        [self setupSound];
        [self setupLayers];
        [self setupTitle];

        
    }
    return self;
}

- (void)setupLayers
{
    _gameLayer = [SKNode node];
    [self addChild:_gameLayer];
    
    _hudLayer = [SKNode node];
    [self addChild:_hudLayer];
}

- (void)setupTitle
{
    NSString *fontName = @"Avenir-Light";
    
    // Title label 1
    _titleLabel1 = [SKLabelNode labelNodeWithFontNamed:fontName];
    _titleLabel1.text = @"Space Game";
    _titleLabel1.fontSize = [self fontSizeForDevice:48.0];
    _titleLabel1.fontColor = [SKColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    _titleLabel1.position = CGPointMake(self.size.width/2, self.size.height * 0.8);
    _titleLabel1.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    [_hudLayer addChild:_titleLabel1];
    
    // Title label 2
    _titleLabel2 = [SKLabelNode labelNodeWithFontNamed:fontName];
    _titleLabel2.text = @"Starter Kit";
    _titleLabel2.fontSize = [self fontSizeForDevice:96.0];
    _titleLabel2.fontColor = [SKColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    _titleLabel2.position = CGPointMake(self.size.width/2, self.size.height * 0.6);
    _titleLabel2.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    [_hudLayer addChild:_titleLabel2];
    
    [_titleLabel1 setScale:0];
    SKAction *waitAction1 = [SKAction waitForDuration:1.0];
    SKAction *scaleAction1 = [SKAction scaleTo:1 duration:0.5];
    scaleAction1.timingMode = SKActionTimingEaseOut;
    [_titleLabel1 runAction:[SKAction sequence:@[waitAction1, _soundTitle, scaleAction1]]];
    
    [_titleLabel2 setScale:0];
    SKAction *waitAction2 = [SKAction waitForDuration:2.0];
    SKAction *scaleAction2 = [SKAction scaleTo:1 duration:1];
    scaleAction2.timingMode = SKActionTimingEaseOut;
    [_titleLabel2 runAction:[SKAction sequence:@[waitAction2, scaleAction2]]];
}

- (void)setupSound {
    [[SKTAudio sharedInstance] playBackgroundMusic:@"SpaceGame.caf"];
    _soundExplosionLarge = [SKAction playSoundFileNamed:@"explosion_large.caf" waitForCompletion:NO];
    _soundExplosionSmall = [SKAction playSoundFileNamed:@"explosion_small.caf" waitForCompletion:NO];
    _soundLaserEnemy = [SKAction playSoundFileNamed:@"laser_enemy.caf" waitForCompletion:NO];
    _soundLaserShip = [SKAction playSoundFileNamed:@"laser_ship.caf" waitForCompletion:NO];
    _soundShake = [SKAction playSoundFileNamed:@"shake.caf" waitForCompletion:NO];
    _soundPowerup = [SKAction playSoundFileNamed:@"powerup.caf" waitForCompletion:NO];
    _soundBoss = [SKAction playSoundFileNamed:@"boss.caf" waitForCompletion:NO];
    _soundCannon = [SKAction playSoundFileNamed:@"cannon.caf" waitForCompletion:NO];
    _soundTitle = [SKAction playSoundFileNamed:@"title.caf" waitForCompletion:NO];
}

- (CGFloat)fontSizeForDevice:(CGFloat)fontSize
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return fontSize * 2;
    } else {
        return fontSize;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
