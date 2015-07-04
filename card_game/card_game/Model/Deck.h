//
//  Deck.h
//  card_game
//
//  Created by hunter on 15/6/27.
//  Copyright (c) 2015年 hunter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (nonatomic,strong) NSMutableArray *card;

-(void)addCard:(Card *)card;
-(Card *)drawRandomCard;


@end
