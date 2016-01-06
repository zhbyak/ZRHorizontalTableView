# ZRHorizontalTableView
基于github原框架改编:http://ptez.github.io/PTEHorizontalTableView  更轻量级 更方便开发使用.使用方法见README.

//设置大小

CGRect frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300);

//初始化方法

PTEHorizontalTableView *hTableView = [PTEHorizontalTableView horizontalTableViewWithFrame:frame andCellReuseIdentifier:reuseID];

//设置代理

hTableView.delegate = self;

//需要对tableView进行设置,使用hTableView.tableView

hTableView.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

//加入需要的控件中

[self.view addSubview:hTableView];
