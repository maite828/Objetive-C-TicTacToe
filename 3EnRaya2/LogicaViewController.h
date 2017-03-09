//
//  LogicaViewController.h
//  3EnRaya2
//
//  Created by Mayte-Mac on 14/3/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jugador.h"

@interface LogicaViewController : UIViewController
//públicos
@property (strong,nonatomic) Jugador *ply1;
@property (strong,nonatomic) Jugador *ply2;
@property (strong,nonatomic) Jugador *contra_ios;
@end


