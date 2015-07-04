//
//  ViewController.m
//  card_game
//
//  Created by hunter on 15/6/17.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "Playcarddeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *click_count_label;
@property (nonatomic,setter=setCountNumber:) int count_number;
@property (strong,nonatomic) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *button_collection;

@property (strong,nonatomic) CardMatchingGame * card_game;

@end


@implementation ViewController

@synthesize button_collection;
-(CardMatchingGame *)card_game
{
    if (!_card_game)
    {
        _card_game=[[CardMatchingGame alloc] initWithCardCount:[button_collection count]
                                                     usingDeck:self.deck];
    }
    return _card_game;
}

-(Deck *)deck
{
    if (!_deck) {
        _deck=[self CreateDeck];
    }
    return _deck;
}

-(Deck *)CreateDeck
{
    return [[Playcarddeck alloc]init];
    
}

-(void)setCountNumber:(int)count_number
{
    _count_number=count_number;
    self.click_count_label.text=[NSString stringWithFormat:@"click count: %d",self.count_number];
    //self.ClickCount.textColor=[]
    //NSLog(@"click number is:%d",self.count_number);
    
}

- (IBAction)touchButton:(UIButton *)sender
{
    [self.card_game chooseCardAtIndex:[self.button_collection indexOfObject:sender]];
    [self updateUI];
    
}

-(void)updateUI
{
    for (UIButton *card_button  in self.button_collection)
    {
        NSUInteger index=[self.button_collection indexOfObject:card_button];
        Card *card=[self.card_game cardAtIndex:index];
        [card_button setTitle:[self titleForCard:card]
                     forState:UIControlStateNormal];
        
    }
}

-(NSString *)titleForCard:(Card*)card
{
    return card.is_chosen?card.content:@"";
}

-(UIImage *)imageForCard:(Card*)card
{
    return [UIImage imageNamed:card.is_chosen?@"cardFront":@"cardBack"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
