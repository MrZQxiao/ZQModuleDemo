//
//  ZQHomeViewController.m
//  ZQHome
//
//  Created by LY on 2023/8/18.
//

#import "ZQHomeViewController.h"
#import "ZQHomeViewModel.h"
#import "ZQHomeListModel.h"
#import "ZQHomeListCell.h"
#import <MJRefresh/MJRefresh.h>

@interface ZQHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZQHomeViewModel *viewModel;

@end

@implementation ZQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"home";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];

    self.viewModel = [[ZQHomeViewModel alloc] init];
    [self.tableView.mj_header beginRefreshing];

}

- (void)loadNew {
    [self.viewModel loadNewDateWithCompletion:^{
        [self.tableView reloadData];
    }];
}

- (void)loadMore {
    [self.viewModel loadMoreWithCompletion:^{
        [self.tableView reloadData];
    }];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ItemCellIdentifier";
    ZQHomeListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[ZQHomeListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }

    ZQHomeListModel *item = self.viewModel.itemArray[indexPath.row];
        cell.titleLabel.text = item.title;

        return cell;
}


@end
