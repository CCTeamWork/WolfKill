//
//  SelectFriendView.m
//  WolfKill
//
//  Created by 清正 on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "SelectFriendView.h"
#import "FriendsCell.h"
#import "MSUHeader.h"

#define totalCount 500

@implementation SelectFriendView {
    BOOL isSelect[totalCount];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor =[UIColor clearColor];
    
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.separatorColor =[UIColor colorWithWhite:0 alpha:0.3];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendsCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[FriendsCell findCellWithIdentifier:@"cell"];
        cell.backgroundColor =[UIColor clearColor];
        TableViewFileAndLineTypeLeft
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
    }
    cell.selectButton.userInteractionEnabled =NO;
    cell.selectButton.selected =isSelect[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row>=totalCount) {
        return;
    }
    isSelect[indexPath.row] =! isSelect[indexPath.row];
    FriendsCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    cell.selectButton.selected =isSelect[indexPath.row];
}

- (IBAction)didRemoveButtonClick:(UIButton *)sender {
    if (_removeBlock) {
        _removeBlock();
    }
}

- (void)removeButtonWithBlock:(ViodBlock)newBlock {
    _removeBlock =newBlock;
}

- (IBAction)inviteButtonClick:(UIButton *)sender {
    if (_dataBlock) {
        NSMutableArray *indexArray =[NSMutableArray array];
        for (NSInteger index=0; index<totalCount; index++) {
            BOOL type =isSelect[index];
            if (type) {
                [indexArray addObject:[NSString stringWithFormat:@"%ld", index]];
            }
        }
        _dataBlock(indexArray);
    }
}

- (void)inviteButtonWithBlock:(SelectDataClick)newBlock {
    _dataBlock = newBlock;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
