//
//  Deck.m
//  card_game
//
//  Created by hunter on 15/6/27.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import "Deck.h"
#import "Card.h"


@implementation Deck


-(NSMutableArray *)card
{
    if (!_card)
    {
        _card=[[NSMutableArray alloc] init];
    }
    return _card;
}


-(void)addCard:(Card *)card
{
    [self addCardAtTop:card is_at_top:NO];
}

-(void)addCardAtTop:(Card *)card is_at_top:(BOOL)at_top
{
    if(at_top)
    {
        [self.card insertObject:card atIndex:0];
    }
    else
    {
        [self.card addObject:card];
    }
}

-(Card *)drawRandomCard
{
    Card * random_card=nil;
    if ([self.card count])
    {
        //get a random card and remove it from deck pool
        unsigned index=arc4random()%[self.card count];
        random_card=self.card[index];
    }
    return  random_card;
}


@end
