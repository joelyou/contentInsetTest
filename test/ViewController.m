//
//  ViewController.m
//  test
//
//  Created by oyq on 2017/7/3.
//  Copyright © 2017年 XHJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = ({
        UITableView *aTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        aTableView.delegate = self;
        aTableView.dataSource = self;
        aTableView.backgroundColor = [UIColor clearColor];
        aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        aTableView.showsVerticalScrollIndicator = NO;
        aTableView.showsHorizontalScrollIndicator = NO;
        aTableView;
    });
    
    UIEdgeInsets contentInset = _tableView.contentInset;
    contentInset.top = 60;
    _tableView.contentInset = contentInset;
    
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(0, 0-_tableView.bounds.size.height,_tableView.frame.size.width, _tableView.bounds.size.height)];
    testView.backgroundColor = [UIColor grayColor];
    [_tableView addSubview:testView];
    
    
    UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 120, 40)];
    testLabel.text = @"测试一下";
    [testLabel sizeToFit];
    testLabel.frame = CGRectMake((_tableView.frame.size.width - testLabel.frame.size.width)/2, testView.frame.size.height - 10 - testLabel.frame.size.height, testLabel.frame.size.width, testLabel.frame.size.height);
    testLabel.textColor = [UIColor yellowColor];
    [testView addSubview:testLabel];
    

    
    [self.view addSubview:_tableView];
}


#pragma mark - TableView DataSource && Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = 0;
    
    cellHeight = 44;
    
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    cell = [self createTextCell:tableView atIndexPath:indexPath];
    
    if (!cell) {
        NSAssert(0, @"emptyCell");
        cell = [self defaultEmptyCell:tableView];
    }
    return cell;
}

- (UITableViewCell *)createTextCell:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseId = @"textCellReuseId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellReuseId];
        cell.textLabel.text = [NSString stringWithFormat:@"文本%ld",indexPath.row];
    }
    return cell;
}


- (UITableViewCell *)defaultEmptyCell:(UITableView *)tableView {
    static NSString *emptyCell = @"emptyReusedCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:emptyCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:emptyCell];
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
