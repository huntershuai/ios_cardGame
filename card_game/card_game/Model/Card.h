//
//  Card.h
//  card_game
//
//  Created by hunter on 15/6/27.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString *content;
@property (nonatomic,getter=isChosen) BOOL is_chosen;
@property (nonatomic,getter=isMatched) BOOL is_matched;

-(int)match:(NSArray *)other_cards;

@end
