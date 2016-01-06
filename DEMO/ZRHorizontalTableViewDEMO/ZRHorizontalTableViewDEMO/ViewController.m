//
//  ViewController.m
//  ZRHorizontalTableViewDEMO
//
//  Created by 中投视讯 on 16/1/6.
//  Copyright © 2016年 zhbyak. All rights reserved.
//

#import "ViewController.h"
#import "PTEHorizontalTableView.h"

//随机颜色分类
@interface UIColor (RandomColor)
+(UIColor *) randomColor;
@end

@implementation UIColor (RandomColor)
+(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end



@interface ViewController ()<PTETableViewDelegate>

@end

@implementation ViewController

static NSString * const reuseID = @"zhbyak";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300);
    
    //初始化方法
    PTEHorizontalTableView *hTableView = [PTEHorizontalTableView horizontalTableViewWithFrame:frame andCellReuseIdentifier:reuseID];
    
    //设置代理
    hTableView.delegate = self;
    
    //需要对tableView进行设置,使用hTableView.tableView
    hTableView.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //加入需要的控件中
    [self.view addSubview:hTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PTETableViewDelegate
- (NSInteger)tableView:(PTEHorizontalTableView *)horizontalTableView
 numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(PTEHorizontalTableView *)horizontalTableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [horizontalTableView.tableView dequeueReusableCellWithIdentifier:@"zhbyak"];
    
    cell.backgroundColor = [UIColor randomColor];
    
    return cell;
    
}


- (NSUInteger)numberOfSectionsInTableView:(PTEHorizontalTableView*)horizontalTableView{
    return 2;
}

//- (void)tableView:(PTEHorizontalTableView *)horizontalTableView
//didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

//- (UIView*)tableView:(PTEHorizontalTableView*)horizontalTableView
//viewForHeaderInSection:(NSInteger)section;

//- (UIView*)tableView:(PTEHorizontalTableView*)horizontalTableView
//viewForFooterInSection:(NSInteger)section;

- (CGFloat)tableView:(PTEHorizontalTableView *)horizontalTableView
widthForCellAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
@end
