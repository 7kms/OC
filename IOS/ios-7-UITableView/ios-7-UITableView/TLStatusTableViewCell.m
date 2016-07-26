//
//  TLStatusTableViewCell.m
//  ios-7-UITableView
//
//  Created by tangliang on 16/7/23.
//  Copyright © 2016年 tangliang. All rights reserved.
//

#import "TLStatusTableViewCell.h"
#import "TLStatus.h"

#define TLColor(r,g,b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1] //颜色宏定义
#define tStatusTableViewCellControlSpacing 10 //控件间距
#define tStatusTableViewCellBackgroundColor TLColor(251,251,251)
#define tStatusGrayColor TLColor(50,50,50)
#define tStatusLightGrayColor TLColor(120,120,120)

#define tStatusTableViewCellAvatarWidth 40 //头像宽度
#define tStatusTableViewCellAvatarHeight tStatusTableViewCellAvatarWidth
#define tStatusTableViewCellUserNameFontSize 14
#define tStatusTableViewCellMbTypeWidth 13 //会员图标宽度
#define tStatusTableViewCellMbTypeHeight tStatusTableViewCellMbTypeWidth
#define tStatusTableViewCellCreateAtFontSize 12
#define tStatusTableViewCellSourceFontSize 12
#define tStatusTableViewCellTextFontSize 14

@interface TLStatusTableViewCell(){
    UIImageView *_avatar;
    UIImageView *_mbType;
    UILabel *_userName;
    UILabel *_createAt;
    UILabel *_source;
    UILabel *_text;
}

@end

@implementation TLStatusTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self initSubView];
    }
    return self;
}
//自定义cell分为两个步骤: 首先进行各种控件的初始化工作,这个过程中只要将控件放到cell的view中,同时设置控件显示的格式(字体大小,颜色等),然后在数据对象设置方法中进行各个控件的布局(大小,位置)
#pragma mark 初始化视图
-(void) initSubView{
    //头像控件
    _avatar = [[UIImageView alloc] init];
    [self.contentView addSubview:_avatar];
    //用户名
    _userName = [[UILabel alloc] init];
    _userName.textColor = tStatusGrayColor;
    _userName.font = [UIFont systemFontOfSize:tStatusTableViewCellUserNameFontSize];
    [self.contentView addSubview:_userName];
    //会员类型
    _mbType = [[UIImageView alloc] init];
    [self.contentView addSubview:_mbType];
    //日期
    _createAt = [[UILabel alloc] init];
    _createAt.textColor = tStatusLightGrayColor;
    _createAt.font = [UIFont systemFontOfSize:tStatusTableViewCellCreateAtFontSize];
    [self.contentView addSubview:_createAt];
    //设备
    _source = [[UILabel alloc] init];
    _source.textColor = tStatusLightGrayColor;
    _source.font = [UIFont systemFontOfSize:tStatusTableViewCellSourceFontSize];
    [self.contentView addSubview:_source];
    //内容
    _text = [[UILabel alloc] init];
    _text.textColor = tStatusGrayColor;
    _text.font = [UIFont systemFontOfSize:tStatusTableViewCellTextFontSize];
    _text.numberOfLines = 0;
    //_text.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:_text];
}

#pragma mark 设置微博
//对于单行文本数据的显示调用 -(CGSize)sizeWithAttributes:(NSDictionary*)attrs;方法来得到文本的宽度和高度.
//对于多行文本数据的显示调用 -(CGSize)boundingRectWithSize:(CGSize)size options:(NSStringDrawingOptions)options attributes:(NSDictionary *)attributes context:(NSStringDwawingContext *)context;方法来得到文本的宽度和高度,同时注意在此之前需要设置文本控件的numberOfLines属性为0
//通常我们会在自定义cell中设置一个高度属性,用于外界方法调用,因为cell内部设置cell的高度是没有用的,UITableViewCell在初始化时会重新设置高度
-(void)setStatus:(TLStatus *)status{
    //设置头像大小和位置
    CGFloat avatarX=10,avatarY=10;
    CGRect avatarRect = CGRectMake(avatarX, avatarY, tStatusTableViewCellAvatarWidth, tStatusTableViewCellAvatarHeight);
    _avatar.image = [UIImage imageNamed:status.profileImageUrl];
    _avatar.frame = avatarRect;
    
    //设置会员名字大小和位置
    CGFloat userNameX = CGRectGetMaxX(_avatar.frame) + tStatusTableViewCellControlSpacing;
    CGFloat userNameY = avatarY;
    //根据文本内容取得文本占用空间的大小
    CGSize userNameSize = [status.userName sizeWithAttributes: @{NSFontAttributeName: [UIFont systemFontOfSize:tStatusTableViewCellUserNameFontSize]}];
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    _userName.text = status.userName;
    _userName.frame = userNameRect;
    
    //设置会员图标大小和位置
    CGFloat mbTypeX = CGRectGetMaxX(userNameRect) + tStatusTableViewCellControlSpacing;
    CGFloat mbTypeY = avatarY;
    CGRect mbTypeRect = CGRectMake(mbTypeX, mbTypeY,tStatusTableViewCellMbTypeWidth, tStatusTableViewCellMbTypeHeight);
    _mbType.image = [UIImage imageNamed:status.mbtype];
    _mbType.frame = mbTypeRect;
    
    //设置发布日期大小和位置
    CGSize createAtSize = [status.createdAt sizeWithAttributes: @{NSFontAttributeName: [UIFont systemFontOfSize:tStatusTableViewCellCreateAtFontSize]}];
    CGFloat createAtX = userNameX;
    CGFloat createAtY = CGRectGetMaxY(_avatar.frame) -  createAtSize.height;
    CGRect createAtRect = CGRectMake(createAtX, createAtY, createAtSize.width, createAtSize.height);
    _createAt.text = status.createdAt;
    _createAt.frame = createAtRect;
    
    //设置设备信息大小和位置
    CGSize sourceSize = [status.source sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:tStatusTableViewCellSourceFontSize]}];
    CGFloat sourceX = CGRectGetMaxX(_createAt.frame) + tStatusTableViewCellControlSpacing;
    CGFloat sourceY = createAtY;
    CGRect sourceRect = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    _source.text = status.source;
    _source.frame = sourceRect;
    
    //设置微博类容大小和位置
    
    CGFloat textX = avatarX;
    CGFloat textY = CGRectGetMaxY(_avatar.frame) + tStatusTableViewCellControlSpacing;
    CGFloat textWidth = self.frame.size.width - tStatusTableViewCellControlSpacing*2;
    CGSize textSize = [status.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:tStatusTableViewCellTextFontSize]} context:nil].size;
    CGRect textRect = CGRectMake(textX, textY, textWidth, textSize.height);
    _text.text = status.text;
    _text.frame = textRect;
    
    _height = CGRectGetMaxY(_text.frame) + tStatusTableViewCellControlSpacing;
    NSLog(@"单元格布局");
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


#pragma mark 重写选中事件,取消选中
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
