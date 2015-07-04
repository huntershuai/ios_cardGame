//
//  PlayCard.h
//  card_game
//
//  Created by hunter on 15/6/27.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import "Card.h"

@interface PlayCard : Card
@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray*)ValidSuits;
+(NSUInteger)maxRank;


@end
