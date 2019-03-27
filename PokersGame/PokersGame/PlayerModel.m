//
//  PlayerModel.m
//  PokersGame
//
//  Copyright © 2017年 liu. All rights reserved.
//

#import "PlayerModel.h"

@implementation PlayerModel
- (instancetype)init{
    if (self = [super init]) {
        _pokerArr = [[NSMutableArray alloc] init];
        _pokerImgViewArr = [[NSMutableArray alloc] initWithArray:@[
                                                                   [[UIImageView alloc] init],
                                                                   [[UIImageView alloc] init],
                                                                   [[UIImageView alloc] init],
                                                                   [[UIImageView alloc] init],
                                                                   [[UIImageView alloc] init]]];
        _moneyNum = 5000;
        _isDizu = false;
        _jiabeiNum = 0;
    }
    return self;
}
@end
