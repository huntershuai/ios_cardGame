//
//  Card.m
//  card_game
//
//  Created by hunter on 15/6/27.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import "Card.h"

@interface Card()

//@property (strong,nonatomic) NSString *content;
//@property (nonatomic,getter=isChosen) BOOL is_chosen;
//@property (nonatomic,getter=isMatched) BOOL is_matched;

//-(int)match:(NSArray *)other_cards;

@end


@implementation Card

-(int)match:(NSArray *)other_cards
{
    int score=0;
    for(Card *card in other_cards)
    {
        if([card.content isEqualToString:self.content])
        {
            score=1;
        }
    }
    return score;
}


    
@end
