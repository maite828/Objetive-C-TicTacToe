//
//  Tablero.h
//  3EnRaya2
//
//  Created by Mayte-Mac on 15/3/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Jugador.h"

@interface Tablero : NSObject

- (id) initWithTablero;

-(BOOL)getUsed;
-(void)setUsed:(BOOL)usedd;

-(NSInteger)getNunTouch;
-(void)setNunTouch:(NSInteger)touch;

-(NSString*)getWinner;
-(void)setWinner:(NSString*)winnerr;

-(Jugador*)getPlayer;
-(void)setPlayer:(Jugador*)player;

@end
