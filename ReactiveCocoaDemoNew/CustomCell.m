//
//  CustomCell.m
//  ReactiveCocoaDemoNew
//
//  Created by 123456 on 17/1/12.
//  Copyright © 2017年 123456. All rights reserved.
//

#import "CustomCell.h"


@interface CustomCell ()
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *content;
@end
@implementation CustomCell
- (void)assignValue {
    
}

- (void)createPage {
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    self.name.text = @"sfdsl;jf;jlk;jl;j;lj;jl;kl";
    [self.view addSubview:self.name];
    
    self.content = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 200, 40)];
    self.content.text = @"safdsmfldsmflksjdflsdjfkljsdklfjkldsjflk";
    [self.view addSubview:self.content];
}

@end
