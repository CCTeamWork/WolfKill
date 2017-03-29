//
//  MainCenterView.m
//  WolfKill
//
//  Created by 清正 on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MainCenterView.h" 
#import "MessageCell.h"
#import "MSUHeader.h"

@interface MainCenterView ()

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *centerLabel;


@end

@implementation MainCenterView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _tableView.estimatedRowHeight =UITableViewAutomaticDimension;
    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.showsVerticalScrollIndicator =NO;
}
// 设置顶部阴影内文本
- (void)setTopText:(NSString *)topText {
    _topText =topText;
    if (_topText.length ==0) {
        _topLabel.superview.hidden =YES;
        _topLabel.text =@"";
    } else {
        _topLabel.superview.hidden =NO;
        _topLabel.text =_topText;
    }
}
// 设置中间文本
- (void)setCenterText:(NSString *)centerText {
    _centerText =centerText;
    if (_centerText.length ==0) {
        _centerLabel.text =@"";
        _centerLabel.hidden =YES;
    } else {
        _centerLabel.text =centerText;
        _centerLabel.hidden =NO;
    }
}
// 消息数组get方法
- (NSMutableArray *)messArray {
    if (!_messArray) {
        _messArray =[NSMutableArray array];
    }
    return _messArray;
}
// 消息数组set方法
- (void)setMessageArray:(NSMutableArray *)messageArray {
    _messArray = messageArray;
    [_tableView reloadData];
    [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentSize.height -self.tableView.bounds.size.height) animated:YES];
}
// 单挑消息
- (void)setMessage:(NSString *)message {
    if (message.length ==0) {
        return;
    }
    _message =message;
    [self.messArray addObject:message];
}
#pragma mark ===>UITabelViewDelagate<===
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _messArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[self findCellWithIdentifier:@"cell"];
        cell.backgroundColor =[UIColor clearColor];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        TableViewFileAndLineTypeLeft
    }
    return cell;
}

-(MessageCell*)findCellWithIdentifier:(NSString*)identifier {
    NSArray *cellArray =[[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:nil options:nil];
    for (MessageCell *cell in cellArray) {
        if ([cell.reuseIdentifier isEqualToString:identifier]) {
            return cell;
        }
    }
    return nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

// 自定义label
@implementation MyLabel

- (void)drawTextInRect:(CGRect)rect {
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(c, 4);
    CGContextSetLineJoin(c, kCGLineJoinRound);
    
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    self.textColor = [UIColor colorWithWhite:0 alpha:0.8];
    [super drawTextInRect:rect];
    
    CGContextSetTextDrawingMode(c, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    
    self.shadowOffset = shadowOffset;
}

@end
