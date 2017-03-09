//
//  Jugador.h
//  3EnRaya2
//
//  Created by Mayte-Mac on 15/3/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Jugador : NSObject
- (id) initWithJugador:(NSInteger)num name:(NSString*)name;
- (id) initWithJugadorTablero;

-(NSString *)getName;

-(NSInteger)getNun;

-(NSInteger)getGained;
-(void)setWon:(NSInteger)num;

-(NSInteger)getLost;
@end
