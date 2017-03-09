//
//  Tablero.m
//  3EnRaya2
//
//  Created by Mayte-Mac on 15/3/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Tablero.h"

@interface Tablero()

@property (nonatomic)  BOOL used;//celda usada
@property (nonatomic)NSInteger nunTouch;//número de toques en el tablero, asi puedo saber cuando empatan
@property (strong,nonatomic)NSString *winner;//nombre ganador
@property (nonatomic)Jugador *player;//número de jugador en el tablero
@end

@implementation Tablero

- (id) initWithTablero{
    if (self = [super init]){
        _used = false;
        _nunTouch = 0;
        _winner = @"";
        _player = [[Jugador alloc]initWithJugadorTablero];
    }
    return self;
}

-(Jugador*)getPlayer{
    return _player;
}
-(void)setPlayer:(Jugador*)player{
    _player = player;
}

-(BOOL)getUsed{
    return _used;
}
-(void)setUsed:(BOOL)usedd{
    _used = usedd;
}

-(NSString*)getWinner{
    return _winner;
}
-(void)setWinner:(NSString*)winnerr{
    _winner = winnerr;
}

-(NSInteger)getNunTouch{
    return _nunTouch;
}
-(void)setNunTouch:(NSInteger)touch{
    _nunTouch = touch;
}

@end
