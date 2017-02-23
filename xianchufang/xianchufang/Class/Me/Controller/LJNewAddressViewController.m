//
//  LJNewAddressViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 17/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJNewAddressViewController.h"
#import "LJVerifyInfo.h"
#import "LJTooltip.h"
@interface LJNewAddressViewController ()
//保存按钮
@property (nonatomic,strong) UIButton *saveBtn;
@property (nonatomic,strong) UITextField *nameField;
@property (nonatomic,strong) UITextField *phoneField;
@property (nonatomic,strong) UITextField *postNum;
@property (nonatomic,strong) UITextField *detailField;
@property (nonatomic,strong) UITableViewCell *provinceCell;
@end

@implementation LJNewAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.lj_y = 13;
    self.tableView.lj_height = spaceEdgeH(300);
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO; //去掉弹性效果
    [self.view addSubview:self.tableView];
    [self addSaveBtn];
    //重写返回键
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    [backBtn sizeToFit];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

- (void)loadData {
    NSArray *data = @[@"李四",@"15518703027",@"上海市宝山区罗泾镇",@"123456",@"陈川新村180",];
    self.nameField.text = data[0];
    self.phoneField.text = data[1];
    self.provinceCell.detailTextLabel.text = data[2];
    self.postNum.text = data[3];
    self.detailField.text = data[4];
}


#pragma mark --代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(44);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 160, 0, 150, spaceEdgeH(35))];
    textField.lj_centerY = cell.lj_height / 2;
    textField.textAlignment = NSTextAlignmentRight;
    textField.textColor = LJFontColor4c;
    [textField setFont:LJFontSize16];
    textField.tag = indexPath.row + 100;
    textField.delegate =self;
    [textField addTarget:self action:@selector(edingChange) forControlEvents:UIControlEventEditingChanged];
    [cell addSubview:textField];
    
    cell.textLabel.textColor = LJFontColor4c;
    [cell.textLabel setFont:LJFontSize16];
    cell.detailTextLabel.textColor = LJFontColor88;
    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:15]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    if (indexPath.row == 0) {
        cell.textLabel.text = @"收货人姓名";
        UITextField *textField = (UITextField*)[cell viewWithTag:indexPath.row + 100];
        textField.placeholder = @"收货人姓名";
        self.nameField = textField;
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"手机号码";
        UITextField *textField = (UITextField*)[cell viewWithTag:indexPath.row + 100];
        textField.placeholder = @"收货人手机号";
        self.phoneField = textField;
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"省、市、区/县";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UITextField *textField = (UITextField*)[cell viewWithTag:indexPath.row + 100];
        [textField removeFromSuperview];
        cell.detailTextLabel.text = @"请选择";
        self.provinceCell = cell;
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"邮政编码";
        UITextField *textField = (UITextField*)[cell viewWithTag:indexPath.row + 100];
        textField.placeholder = @"邮政编码";
        self.postNum = textField;
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"详细地址";
        UITextField *textField = (UITextField*)[cell viewWithTag:indexPath.row + 100];
        textField.placeholder = @"请输入详细地址";
        self.detailField = textField;
        textField.lj_x = 100;
        textField.lj_width = SCREEN_WIDTH - 110;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        LJTooltip *tip = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAddress];
        tip.okClickBlock = ^ (NSString * str) {
            LJLog(@"%@" ,str);
        };
        [tip showTooltip];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        if ([self.navigationItem.title isEqualToString:@"修改地址"]) {
            [self loadData];
        }
    }
}

#pragma mark --textField代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.tag == 101) {
        if (textField.text.length - range.length + string.length > 11) {
            return NO;
        }
        return [LJVerifyInfo isNumText:[textField.text stringByAppendingString:string]];
    }
    if (textField.tag == 103) {
        if (textField.text.length - range.length + string.length > 6) {
            return NO;
        }
        return [LJVerifyInfo isNumText:[textField.text stringByAppendingString:string]];
    }
    return YES;
}


#pragma mark --监听保存按钮的状态
- (void)edingChange {
    if (self.nameField.text.length > 0 && self.phoneField.text.length > 0 && ![self.provinceCell.detailTextLabel.text isEqualToString:@"请选择"] > 0 &&self.postNum.text.length > 0 &&self.detailField.text.length >0) {
        self.saveBtn.backgroundColor = [UIColor redColor];
        self.saveBtn.enabled =YES;
    }else{
        self.saveBtn.backgroundColor = LJFontColor88;
        self.saveBtn.enabled =NO;
    }
}

#pragma mark --添加保存按钮
- (void)addSaveBtn {
    self.saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, SCREEN_HEIGHT -86, SCREEN_WIDTH - 56, spaceEdgeH(44))];
    self.saveBtn.backgroundColor = LJFontColorc3;
    self.saveBtn.enabled = NO;
    [self.saveBtn.titleLabel setFont:LJFontSize16];
    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [self.saveBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [self.saveBtn setLayerWithCr:5];
    [self.saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveBtn];
}

//self.saveBtn Click
- (void)saveBtnClick {
    LJLogFunc
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --解决键盘遮挡问题
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ( textField.tag == 104) {
        //滑动效果（动画）
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        
        //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
        self.view.frame = CGRectMake(0.0f, -25.f, self.view.frame.size.width, self.view.frame.size.height);//64-216
        [UIView commitAnimations];  
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ( textField.tag == 104) {
        //滑动效果
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        [UIView setAnimationDuration:animationDuration];
        
        //恢复屏幕
        self.view.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);//64-216
        [UIView commitAnimations];}
}

- (void) back{
    if ([self.nameField.text isEqualToString:@""]&&[self.phoneField.text isEqualToString:@""]&&[self.provinceCell.detailTextLabel.text isEqualToString:@"请选择"]&&[self.postNum.text isEqualToString:@""]&&[self.detailField.text isEqualToString:@""]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        LJTooltip *tip =[[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert2];
        [tip Alert2content:@"确定要退出么？"];
        __weak LJNewAddressViewController *weakSelf = self;
        tip.okClickBlock =^ (NSString *str) {
            if ([str isEqualToString:@"确定"]) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
        };
        [tip showTooltip];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
