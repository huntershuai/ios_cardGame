//
//  PlayCard.m
//  card_game
//
//  Created by hunter on 15/6/27.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import "PlayCard.h"

@implementation PlayCard

-(NSString*)content
{
    NSArray *rank_string=[PlayCard rankStrings];
    return [rank_string[self.rank] stringByAppendingString:self.suit];
    
}


-(int)match:(NSArray *)other_cards
{
    int score;
    PlayCard *match_card=[other_cards firstObject];
    if ([other_cards count]==1)
    {
        if (match_card.rank==self.rank)
        {
            score=4;
        }
        else if(match_card.suit==self.suit)
        {
            score=1;
        }
    }
    return score;
}

@synthesize suit=_suit;
@synthesize rank;
-(void)setSuit:(NSString *)suit
{
    if ([[ PlayCard ValidSuits] containsObject:suit]) {
        _suit=suit;
    }
}

-(NSString*)suit
{
    return _suit?_suit:@"?";
}

//+ class method

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",
             @"5",@"6",@"7",@"8",@"9",
             @"10",@"J",@"Q",@"K"];
}

+(NSArray *)ValidSuits
{
    return @[@"♥︎",@"♠︎",@"♦︎",@"♣︎"];
}
+(NSUInteger)maxRank
{
    return ([[PlayCard rankStrings] count]-1);
}

@end
