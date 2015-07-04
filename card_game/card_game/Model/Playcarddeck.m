//
//  Playcarddeck.m
//  card_game
//
//  Created by hunter on 15/6/27.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import "Playcarddeck.h"
#import "PlayCard.h"


@implementation Playcarddeck

-(instancetype)init
{
    self=[super init];
    
    for (NSString *suit in [PlayCard ValidSuits])
    {
        for (UInt16 index=0; index<[PlayCard maxRank]+1; index++)
        {
            PlayCard *play_card=[[PlayCard alloc]init];
            play_card.suit=suit;
            play_card.rank=index;
            
            //add card to deck, play card is sub-class of card
            [self addCard:play_card];
            
        }
    }
    return self;
}


@end
