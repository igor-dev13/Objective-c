//
//  MyTableViewCell.m
//  Currency
//
//  Created by Admin on 09.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.textLabel.text = @"";
}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    
//    self = [super initWithStyle:Style reuseIdentifier:reuseIdentifier];
//    
//    if (self) { self.backgroundColor = [UIColor greenColor]; } return self;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}



@end
