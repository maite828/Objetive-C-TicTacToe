//
//  ResultadoViewController.m
//  3EnRaya2
//
//  Created by Mayte-Mac on 23/4/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//

#import "ResultadoViewController.h"

@interface ResultadoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rJugador1;
@property (weak, nonatomic) IBOutlet UILabel *rJugador2;
@property (weak, nonatomic) IBOutlet UILabel *nJugador1;
@property (weak, nonatomic) IBOutlet UILabel *nJugador2;
@property (weak, nonatomic) IBOutlet UILabel *equal;

@end

@implementation ResultadoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[self.ply1 getName] isEqualToString:@""] & [[self.ply1 getName] isEqualToString:@""]) {
        self.nJugador1.text = [self.contraIos getName];
        self.nJugador2.text = [self.ios getName];
        self.rJugador1.text = [NSString stringWithFormat:@"%d", (int)[self.contraIos getGained]];
        self.rJugador2.text = [NSString stringWithFormat:@"%d", (int)[self.ios getGained]];
    }else{
        self.nJugador1.text = [self.ply1 getName];
        self.nJugador2.text = [self.ply2 getName];
    
        self.rJugador1.text = [NSString stringWithFormat:@"%d", (int)[self.ply1 getGained]];
        self.rJugador2.text = [NSString stringWithFormat:@"%d", (int)[self.ply2 getGained]];
    }
    self.equal.text = [NSString stringWithFormat:@"%d", (int)self.tie];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
