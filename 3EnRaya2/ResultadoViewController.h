//
//  ResultadoViewController.h
//  3EnRaya2
//
//  Created by Mayte-Mac on 23/4/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jugador.h"

@interface ResultadoViewController : UIViewController
@property (strong,nonatomic) Jugador *ply1;
@property (strong,nonatomic) Jugador *ply2;
@property (strong,nonatomic) Jugador *contraIos;
@property (strong,nonatomic) Jugador *ios;
@property (nonatomic)NSInteger tie;
@end
