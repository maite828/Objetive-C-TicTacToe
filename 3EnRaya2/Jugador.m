//
//  Jugador.m
//  3EnRaya2
//
//  Created by Mayte-Mac on 15/3/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//

#import "Jugador.h"

@interface Jugador()
@property (nonatomic)NSInteger nunPlayer;
@property (strong,nonatomic)NSString* namePlayer;
@property (nonatomic)NSInteger gainedGames;//partidas ganadas
@property (nonatomic)NSInteger lostGames;//partidas perdidas
@end

@implementation Jugador
- (id) initWithJugador:(NSInteger)num name:(NSString*)name {
    if (self = [super init]){
        _nunPlayer = num;
        _namePlayer = name;
        _gainedGames = 0;
    }
    return self;
}

- (id) initWithJugadorTablero{
    if (self = [super init]){
        _nunPlayer = 0;
        _namePlayer = @"";
        _gainedGames = 0;
    }
    return self;
}

-(NSString *)getName{
    return _namePlayer;
}

-(NSInteger)getNun{
    return _nunPlayer;
}

-(NSInteger)getGained{
    return _gainedGames;
}
-(void)setWon:(NSInteger)num{
    _gainedGames = num;
}

-(NSInteger)getLost{
    return _lostGames;
}
-(void)setLost:(NSInteger)num{
    _lostGames = num;
}

@end
