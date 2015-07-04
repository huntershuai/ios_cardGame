//
//  CardMatchingGame.m
//  card_game
//
//  Created by hunter on 15/6/27.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;

@end

static const int BONUS=4;
static const int PENALTY=2;
static const int COST_TO_CHOOSE=1;


@implementation CardMatchingGame
-(NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards=[[NSMutableArray alloc]init];
        
    }
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck
{
    for (NSUInteger index=0; index<count; index++)
    {
        if ([deck.card count])
        {
            [self.cards addObject:[deck drawRandomCard]];
        }
        else
        {
            self=nil;
            break;
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return index<[self.cards count]? self.cards[index]:nil;
}


-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card * card=self.cards[index];
    if (!card.isMatched)
    {
        if (card.isChosen)
        {
            card.is_chosen=NO;
        }
        else
        {
            for (Card * other_card in self.cards)
            {
                if (other_card.isChosen && !other_card.isMatched)
                {
                    self.score=[card match:@[other_card]]*BONUS;
                }
                else
                {
                    self.score-=PENALTY;
                }
            }
            self.score-=COST_TO_CHOOSE;
        }
        card.is_chosen=YES;
    }
    
}



@end
