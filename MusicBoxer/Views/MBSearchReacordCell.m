//
//  MBSearchReacordCell.m
//  MusicBoxer
//
//  Created by 梁中豪 on 2017/9/26.
//  Copyright © 2017年 梁中豪. All rights reserved.
//

#import "MBSearchReacordCell.h"

@interface MBSearchReacordCell()

@property(nonatomic,strong) UILabel *titleLable;
@property(nonatomic,strong) UIButton *cancelButton;
@property(nonatomic,strong) UIView *bottonLine;

@end

@implementation MBSearchReacordCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellStyleDefault;
    self.contentView.backgroundColor = UIColor.whiteColor;
    UIView *selectedBgView = [[UIView alloc] init];
    selectedBgView.backgroundColor = UIColor.lightGrayColor;
    self.selectedBackgroundView = selectedBgView;
    
    _titleLable =[[UILabel alloc] init];
    _titleLable.backgroundColor = UIColor.whiteColor;
    _titleLable.font = [UIFont systemFontOfSize:14.0];
    _titleLable.textColor = [UIColor orangeColor];
    //设置超出label后显示的方式
    _titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:_titleLable];
    
    _cancelButton = [[UIButton alloc] init];
    _cancelButton.backgroundColor = UIColor.clearColor;
    _cancelButton.layer.cornerRadius = 20.0;
    _cancelButton.layer.masksToBounds = YES;
    [_cancelButton setImage:[UIImage imageNamed:@"cancel_button"] forState:UIControlStateNormal];
    _cancelButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.contentView addSubview:_cancelButton];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(_cancelButton.mas_left).with.offset(-10);
        make.height.mas_equalTo(20);
    }];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(self.mas_right).with.offset(-10);
        make.height.and.width.mas_equalTo(40);
        make.centerY.mas_equalTo(self.contentView.centerY);
    }];


    return self;
}

- (void)setItemWithTitle:(NSString *)title
{
    _titleLable.text = title;
    _cancelButton.hidden = YES;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
