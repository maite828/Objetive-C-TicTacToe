//
//  ViewController.m
//  3EnRaya2
//
//  Created by Mayte-Mac on 14/3/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//
//Aqui lo unico que hago es recoger los nombres de los jugadores y pasarlos a la lógica del juego

#import "ViewController.h"
#import "LogicaViewController.h"
#import "Jugador.h"

@interface ViewController ()
//privados
@property (strong,nonatomic) Jugador *ply1;
@property (strong,nonatomic) Jugador *ply2;
@property (strong,nonatomic) Jugador *ios;

@property (weak, nonatomic) IBOutlet UITextField *player1;
@property (weak, nonatomic) IBOutlet UITextField *player2;
@property (weak, nonatomic) IBOutlet UITextField *player3;

//mensajes o alertas
@property UIAlertController *msgResult;//resultado de partida
@property UIAlertAction *accion;

@end

@implementation ViewController

//lazy inicialización o inicialización vaga
-(Jugador *)ply1{
    if (!_ply1) {
        [self.player1 resignFirstResponder];
        _ply1 = [[Jugador alloc]initWithJugador:1 name:self.player1.text];
    }
    return _ply1;
}

-(Jugador *)ply2{
    if (!_ply2) {
        [self.player2 resignFirstResponder];
        _ply2 = [[Jugador alloc]initWithJugador:2 name:self.player2.text];
    }
    return _ply2;
}

-(Jugador *)ios{
    if (!_ios) {
        [self.player3 resignFirstResponder];
        _ios = [[Jugador alloc]initWithJugador:3 name:self.player3.text];
    }
    return _ios;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.player1.delegate = self;//conecto el delegado
    self.player2.delegate = self;
    self.player3.delegate = self;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}


- (IBAction)play {
    /*if (self.player1.text != nil || self.player3.text != nil) {
        [self performSegueWithIdentifier:@"logicaPush" sender:self];
    }*/
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    LogicaViewController *logica = (LogicaViewController *)[segue destinationViewController];
    
    //Alertas
    if(![self.player1.text isEqualToString:@""] & ![self.player3.text isEqualToString:@""]){
        self.msgResult = [UIAlertController alertControllerWithTitle:@"Error" message:@"Datos mal introducidos!"preferredStyle:UIAlertControllerStyleAlert];
        self.accion = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.msgResult dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.msgResult addAction:self.accion];
        [self presentViewController:self.msgResult animated:YES completion:nil];
    }
    if(![self.player2.text isEqualToString:@""] & ![self.player3.text isEqualToString:@""]){
        self.msgResult = [UIAlertController alertControllerWithTitle:@"Error" message:@"Datos mal introducidos!"preferredStyle:UIAlertControllerStyleAlert];
        self.accion = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.msgResult dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.msgResult addAction:self.accion];
        [self presentViewController:self.msgResult animated:YES completion:nil];
    }
    
    if(![self.player1.text isEqualToString:@""] & [self.player2.text isEqualToString:@""]){
        self.msgResult = [UIAlertController alertControllerWithTitle:@"Error" message:@"Falta un jugador!"preferredStyle:UIAlertControllerStyleAlert];
        self.accion = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.msgResult dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.msgResult addAction:self.accion];
        [self presentViewController:self.msgResult animated:YES completion:nil];
    }
    
    if([self.player1.text isEqualToString:@""] & ![self.player2.text isEqualToString:@""]){
        self.msgResult = [UIAlertController alertControllerWithTitle:@"Error" message:@"Falta un jugador!"preferredStyle:UIAlertControllerStyleAlert];
        self.accion = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.msgResult dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.msgResult addAction:self.accion];
        [self presentViewController:self.msgResult animated:YES completion:nil];
    }
    
    if([self.player1.text isEqualToString:@""] & [self.player2.text isEqualToString:@""] & [self.player3.text isEqualToString:@""]){
        self.msgResult = [UIAlertController alertControllerWithTitle:@"Error" message:@"Faltan un jugadores!"preferredStyle:UIAlertControllerStyleAlert];
        self.accion = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.msgResult dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.msgResult addAction:self.accion];
        [self presentViewController:self.msgResult animated:YES completion:nil];
    }
    
    logica.ply1 = self.ply1;
    logica.ply2 = self.ply2;
    logica.contra_ios = self.ios;
    
    self.ply1 = nil;
    self.ply2 = nil;
    self.ios = nil;
    
    self.player1.text = @"";
    self.player2.text = @"";
    self.player3.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
