//
//  LogicaViewController.m
//  3EnRaya2
//
//  Created by Mayte-Mac on 14/3/16.
//  Copyright © 2016 Maite Echeverry. All rights reserved.
//

#import "LogicaViewController.h"
#import "Tablero.h"
#import "ResultadoViewController.h"

@interface LogicaViewController ()

//privado
@property (strong,nonatomic) Tablero *tablero;
@property (strong,nonatomic) Jugador *ios;

//variables partidas
@property (nonatomic)NSInteger wonJugador1;
@property (nonatomic)NSInteger wonJugador2;
@property (nonatomic)NSInteger wonContraIos;
@property (nonatomic)NSInteger wonIOS;
@property (nonatomic)NSInteger tie;

//nombres de jugadores
@property (weak, nonatomic) IBOutlet UILabel *player1;
@property (weak, nonatomic) IBOutlet UILabel *player2;

//imagenes de jugadores
@property (weak, nonatomic) IBOutlet UIImageView *playX;
@property (weak, nonatomic) IBOutlet UIImageView *playO;

//imagenes de las casillas, meter en clase Tablero
@property (nonatomic)UIImage *playerO;//imagenes para asignar a las celdas
@property (nonatomic)UIImage *playerX;
@property (nonatomic)UIImage *cel;//celda en tablero

//mensajes o alertas
@property UIAlertController *msgResult;//resultado de partida
@property UIAlertAction *accion;

//pinto partida ganada
@property UIView *pintoGana;
@property (nonatomic)  BOOL bandera;//

//casillas
@property (weak, nonatomic) IBOutlet UIImageView *pOne;
@property (weak, nonatomic) IBOutlet UIImageView *pTwo;
@property (weak, nonatomic) IBOutlet UIImageView *pTree;
@property (weak, nonatomic) IBOutlet UIImageView *pFour;
@property (weak, nonatomic) IBOutlet UIImageView *pFive;
@property (weak, nonatomic) IBOutlet UIImageView *pSix;
@property (weak, nonatomic) IBOutlet UIImageView *pSeven;
@property (weak, nonatomic) IBOutlet UIImageView *pEight;
@property (weak, nonatomic) IBOutlet UIImageView *pNine;

//divulgador de turno
@property (weak, nonatomic) IBOutlet UILabel *turn;

@end

@implementation LogicaViewController

//Lazy inicialización
-(Tablero *)tablero{
    if (!_tablero) {
        _tablero = [[Tablero alloc]initWithTablero];
    }
    return _tablero;
}

-(Jugador *)ios{
    if (!_ios) {
        _ios = [[Jugador alloc]initWithJugador:4 name:@"iOS"];
    }
    return _ios;
}

- (void)viewDidLoad {
    self.tie = 0;
    self.wonJugador1 = 0;
    self.wonJugador2 = 0;
    self.wonContraIos = 0;
    self.wonIOS = 0;
    self.bandera = false;
    
    if ([[self.ply1 getName] isEqualToString:@""] & [[self.ply2 getName] isEqualToString:@""]) {
        self.player1.text = [self.contra_ios getName];
        self.player2.text = [self.ios getName];
        self.playO.image = [UIImage imageNamed:@"iphone.png"];
        [self.tablero setPlayer:self.contra_ios];
    }else{
        self.contra_ios = nil;
        self.player1.text = [self.ply1 getName];
        self.player2.text = [self.ply2 getName];
        [self.tablero setPlayer:self.ply1];
    }
    
    self.playerO = [UIImage imageNamed:@"o.png"];
    self.playerX = [UIImage imageNamed:@"x.png"];
    self.turn.text = [[self.tablero getPlayer] getName];
    
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!self.bandera) {
        if ([[self.tablero getPlayer] getNun ] == [self.ply1 getNun] || [[self.tablero getPlayer] getNun ] == [self.contra_ios getNun]) {
            self.cel = self.playerX;
        }else{
            self.cel = self.playerO;
        }
    
        //capturo los toques de la pantalla mediante un puntero touch, esta extraera los eventos almcenados, y le diremos que extraiga el primero
        UITouch *touch = [[event allTouches] anyObject];
        [self.tablero setUsed:false];//asi evito que al pulsar en la misma tome como true
    
        //Esta función me dirá si en esa región de la pantalla exíste determinado punto
        if (CGRectContainsPoint([self.pOne frame],[touch locationInView:touch.view]) & (self.pOne.image == NULL)) {
            [self.tablero setUsed:true];
            self.pOne.image = self.cel;
        }
        if (CGRectContainsPoint([self.pTwo frame],[touch locationInView:touch.view]) & (self.pTwo.image == NULL)) {
            [self.tablero setUsed:true];
            self.pTwo.image = self.cel;
        }
        if (CGRectContainsPoint([self.pTree frame],[touch locationInView:touch.view]) & (self.pTree.image == NULL)) {
            [self.tablero setUsed:true];
            self.pTree.image = self.cel;
        }
        if (CGRectContainsPoint([self.pFour frame],[touch locationInView:touch.view]) & (self.pFour.image == NULL)) {
            [self.tablero setUsed:true];
            self.pFour.image = self.cel;
        }
        if (CGRectContainsPoint([self.pFive frame],[touch locationInView:touch.view]) & (self.pFive.image == NULL)) {
            [self.tablero setUsed:true];
            self.pFive.image = self.cel;
        }
        if (CGRectContainsPoint([self.pSix frame],[touch locationInView:touch.view]) & (self.pSix.image == NULL)) {
            [self.tablero setUsed:true];
            self.pSix.image = self.cel;
        }
        if (CGRectContainsPoint([self.pSeven frame],[touch locationInView:touch.view]) & (self.pSeven.image == NULL)) {
            [self.tablero setUsed:true];
            self.pSeven.image = self.cel;
        }
        if (CGRectContainsPoint([self.pEight frame],[touch locationInView:touch.view]) & (self.pEight.image == NULL)) {
            [self.tablero setUsed:true];
            self.pEight.image = self.cel;
        }
        if (CGRectContainsPoint([self.pNine frame],[touch locationInView:touch.view]) & (self.pNine.image == NULL)) {
            [self.tablero setUsed:true];
            self.pNine.image = self.cel;
        }
    
        //Si tenemos casilla ocupada con imagen entonces añadiremos a la cuenta de toques en el tablero
        if ([self.tablero getUsed]) {
            [self.tablero setNunTouch:[self.tablero getNunTouch]+1];
            //verifica jugada, veo si hay ganador y hago reset
            [self logicGame];
            //verifica empate, sino cambia turno
            [self updatePlayer];
        }
    }
}

-(void)logicGame{
    if ([self resultGame]) {
        //si ha ganado partida 2 jugadores
        if ([[self.tablero getPlayer] getNun ] == [self.ply1 getNun]) {
            [self.tablero setWinner:self.player1.text];
            self.wonJugador1++;
            [self.ply1 setWon:self.wonJugador1];
        }else if([[self.tablero getPlayer] getNun ] == [self.ply2 getNun]){
            [self.tablero setWinner:self.player2.text];
            [self.tablero setPlayer:self.ply2];
            self.wonJugador2++;
            [self.ply2 setWon:self.wonJugador2];
        }
        
        //si ha ganado partida 1 jugador
        if ([[self.tablero getPlayer] getNun ] == [self.contra_ios getNun]) {
            [self.tablero setWinner:self.player1.text];
            self.wonContraIos++;
            [self.contra_ios setWon:self.wonContraIos];
        }else if([[self.tablero getPlayer] getNun ] == [self.ios getNun]){
            [self.tablero setWinner:self.player2.text];
            self.wonIOS++;
            [self.ios setWon:self.wonIOS];
            [self.tablero setPlayer:self.ios];
        }
        
        //Alerta
        self.msgResult = [UIAlertController alertControllerWithTitle:@"Ganador!" message:[self.tablero getWinner] preferredStyle:UIAlertControllerStyleAlert];
        self.accion = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.msgResult dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.msgResult addAction:self.accion];
        [self presentViewController:self.msgResult animated:YES completion:nil];

        [self.tablero setNunTouch:0];
    }
}


-(BOOL)resultGame{
    //gana con fila y pinto linea
    if ((self.pOne.image == self.pTwo.image) & (self.pTwo.image == self.pTree.image) & (self.pOne.image != NULL)){
        self.pintoGana = [[UIView alloc]initWithFrame:CGRectMake(50, 230, 222, 10)];
        self.pintoGana.backgroundColor = [UIColor whiteColor];
        self.pintoGana.alpha = 0.8;
        [self.view addSubview:self.pintoGana];
        self.bandera = true;
        return true;
    }
    if ((self.pFour.image == self.pFive.image) & (self.pFive.image == self.pSix.image) & (self.pFour.image != NULL)) {
        self.pintoGana = [[UIView alloc]initWithFrame:CGRectMake(50, 323, 222, 10)];
        self.pintoGana.backgroundColor = [UIColor whiteColor];
        self.pintoGana.alpha = 0.8;
        [self.view addSubview:self.pintoGana];
        self.bandera = true;
        return true;
    }
    if ((self.pSeven.image == self.pEight.image) & (self.pEight.image == self.pNine.image) & (self.pSeven.image != NULL)){
        self.pintoGana = [[UIView alloc]initWithFrame:CGRectMake(50, 411, 222, 10)];
        self.pintoGana.backgroundColor = [UIColor whiteColor];
        self.pintoGana.alpha = 0.8;
        [self.view addSubview:self.pintoGana];
        self.bandera = true;
        return true;
    }
    //gana con columna
    if ((self.pOne.image == self.pFour.image) & (self.pFour.image == self.pSeven.image) & (self.pOne.image != NULL)){
        self.pintoGana = [[UIView alloc]initWithFrame:CGRectMake(76.5, 205, 10, 242)];
        self.pintoGana.backgroundColor = [UIColor whiteColor];
        self.pintoGana.alpha = 0.8;
        [self.view addSubview:self.pintoGana];
        self.bandera = true;
        return true;
    }
    if ((self.pTwo.image == self.pFive.image) & (self.pFive.image == self.pEight.image) & (self.pTwo.image != NULL)) {
        self.pintoGana = [[UIView alloc]initWithFrame:CGRectMake(155.5, 205, 10, 242)];
        self.pintoGana.backgroundColor = [UIColor whiteColor];
        self.pintoGana.alpha = 0.8;
        [self.view addSubview:self.pintoGana];
        self.bandera = true;
        return true;
    }
    if ((self.pTree.image == self.pSix.image) & (self.pSix.image == self.pNine.image) & (self.pTree.image != NULL)) {
        self.pintoGana = [[UIView alloc]initWithFrame:CGRectMake(235.5, 205, 10, 242)];
        self.pintoGana.backgroundColor = [UIColor whiteColor];
        self.pintoGana.alpha = 0.8;
        [self.view addSubview:self.pintoGana];
        self.bandera = true;
        return true;
    }
    //gana con diagonal
    if ((self.pOne.image == self.pFive.image) & (self.pFive.image == self.pNine.image) & (self.pOne.image != NULL)) {
        self.pintoGana = [[UIView alloc]initWithFrame:CGRectMake(157, 174, 10, 302)];
        self.pintoGana.backgroundColor = [UIColor whiteColor];
        self.pintoGana.alpha = 0.8;
        self.pintoGana.transform = CGAffineTransformMakeRotation(15);
        [self.view addSubview:self.pintoGana];
        self.bandera = true;
        return true;
    }
    if ((self.pTree.image == self.pFive.image) & (self.pFive.image == self.pSeven.image) & (self.pTree.image != NULL)) {
        self.pintoGana = [[UIView alloc]initWithFrame:CGRectMake(158, 175, 10, 302)];
        self.pintoGana.backgroundColor = [UIColor whiteColor];
        self.pintoGana.alpha = 0.8;
        self.pintoGana.transform = CGAffineTransformMakeRotation(0.7);
        [self.view addSubview:self.pintoGana];
        self.bandera = true;
        return true;
    }
    return false;
}

-(void)updatePlayer{
    //Alerta en caso de empate
    if ([self.tablero getNunTouch] >= 9) {
        self.msgResult = [UIAlertController alertControllerWithTitle:@"No exíste ganador" message:@"Empate!!!" preferredStyle:UIAlertControllerStyleAlert];
        self.accion = [UIAlertAction actionWithTitle:@"Cerrar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.msgResult dismissViewControllerAnimated:YES completion:nil];
        }];
        [self.msgResult addAction:self.accion];
        [self presentViewController:self.msgResult animated:YES completion:nil];
        self.tie ++;
        
        //Limpiamos veces
        [self.tablero setNunTouch:0];
        return;
    }
    
    //cambio el turno 2 jugadores
    if ([[self.tablero getPlayer] getNun] == [self.ply1 getNun]) {
        [self.tablero setPlayer:self.ply2];
        self.turn.text = [self.ply2 getName];
    }else if ([[self.tablero getPlayer] getNun] == [self.ply2 getNun]) {
        [self.tablero setPlayer:self.ply1];
        self.turn.text = [self.ply1 getName];
    }
    
    //cambio de turno un jugador y juega la máquina
    if ([[self.tablero getPlayer] getNun] == [self.contra_ios getNun]) {
        [self.tablero setPlayer:self.ios];
        
        if (!self.bandera) {
            [self juegaMaquina];
        }
        
        self.turn.text = [self.ios getName];
    }else if ([[self.tablero getPlayer] getNun] == [self.ios getNun]) {
        [self.tablero setPlayer:self.contra_ios];
        self.turn.text = [self.contra_ios getName];
    }
}


-(void)juegaMaquina{
    self.cel = self.playerO;
    NSMutableDictionary *libres=[[NSMutableDictionary alloc]init];
    
    if (![self resultGame]) {
        if((self.pOne.image == NULL)){
            [libres setValue:self.pOne forKey:@"1"];
        }
        if((self.pTwo.image == NULL)){
            [libres setValue:self.pTwo forKey:@"2"];
        }
        if((self.pTree.image == NULL)){
            [libres setValue:self.pTree forKey:@"3"];
        }
        if((self.pFour.image == NULL)){
            [libres setValue:self.pFour forKey:@"4"];
        }
        if((self.pFive.image == NULL)){
            [libres setValue:self.pFive forKey:@"5"];
        }
        if((self.pSix.image == NULL)){
            [libres setValue:self.pSix forKey:@"6"];
        }
        if((self.pSeven.image == NULL)){
            [libres setValue:self.pSeven forKey:@"7"];
        }
        if((self.pEight.image == NULL)){
            [libres setValue:self.pEight forKey:@"8"];
        }
        if((self.pNine.image == NULL)){
            [libres setValue:self.pNine forKey:@"9"];
        }
        int count, num;
        NSArray *keys;
        NSString *key;
        UIImageView *value;
        keys = [libres allKeys];
        count = (int)[keys count];
       
        num = arc4random_uniform(count);
        //num = 0+random()%count;
        NSLog (@"ALEATORIO: %d",num);
        key = [keys objectAtIndex: num];
        value = [libres objectForKey: key];
        NSLog (@"Clave: %@ para el valor: %@", key, value);
        
        [self.tablero setUsed:true];
        value.image = self.cel;
        
        [self.tablero setNunTouch:[self.tablero getNunTouch]+1];
        [self logicGame];
        [self updatePlayer];
    }
}

- (IBAction)pulseReset {
    self.pOne.image = NULL;
    self.pTwo.image = NULL;
    self.pTree.image = NULL;
    self.pFour.image = NULL;
    self.pFive.image = NULL;
    self.pSix.image = NULL;
    self.pSeven.image = NULL;
    self.pEight.image = NULL;
    self.pNine.image = NULL;
    if ([[self.tablero getPlayer] getNun] == [self.ply1 getNun] || [[self.tablero getPlayer] getNun] == [self.ply2 getNun]) {
        [self.tablero setPlayer:self.ply1];
        self.turn.text = [self.ply1 getName];
    }else if ([[self.tablero getPlayer] getNun] == [self.contra_ios getNun] || [[self.tablero getPlayer] getNun] == [self.ios getNun]) {
        [self.tablero setPlayer:self.contra_ios];
        self.turn.text = [self.contra_ios getName];
    }
    
    self.pintoGana.alpha = 0.0;
    [self.view addSubview:self.pintoGana];
    
    [self.tablero setNunTouch:0];
    self.bandera = false;
}
    
- (IBAction)pulseSummary {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ResultadoViewController *resultado = (ResultadoViewController *)[segue destinationViewController];
    resultado.ply1 = self.ply1;
    resultado.ply2 = self.ply2;
    resultado.contraIos = self.contra_ios;
    resultado.ios = self.ios;
    resultado.tie = self.tie;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end


