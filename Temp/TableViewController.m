//
//  TableViewController.m
//  Temp
//
//  Created by daixu on 17/2/20.
//  Copyright © 2017年 daixu. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
    UIButton *change;
    UIButton *pop;
}
@property (nonatomic, strong) NSArray *data;

@end

@implementation TableViewController
- (void)viewDidAppear:(BOOL)animated
{
 self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 200);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    self.data = @[@"num 1",
                  @"num 2",
                  @"num 3",
                  @"num 4",
                  @"num 5",
                  @"num 6",
                  @"num 7",
                  @"num 8",
                  @"num 9",
                  @"num 10",
                  @"num 11",
                  @"num 12",
                  @"num 13",
                  @"num 14",
                  @"num 15",
                  @"num 16",
                  @"num 17",
                  @"num 18",
                  @"num 19",
                  @"num 20",
                  @"num 21",
                  @"num 22",
                  @"num 23",
                  @"num 24",
                  @"num 25",
                  @"num 26",
                  @"num 27",
                  ];
    
    
    
    change = [[UIButton alloc] initWithFrame:CGRectMake(100, self.view.frame.size.height - 80, 100, 30)];
    [change setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [change setTitle:@"changedata" forState:UIControlStateNormal];
    [[UIApplication sharedApplication].keyWindow addSubview:change];
    
    [change addTarget:self action:@selector(changeData2) forControlEvents:UIControlEventTouchUpInside];
    
    pop = [[UIButton alloc] initWithFrame:CGRectMake(250, self.view.frame.size.height - 80, 100, 30)];
    [pop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [pop setTitle:@"pop" forState:UIControlStateNormal];
    [[UIApplication sharedApplication].keyWindow addSubview:pop];
    
    [pop addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pop
{
    [change removeFromSuperview];
    [pop removeFromSuperview];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)changeData2
{
    NSTimer *t = [NSTimer timerWithTimeInterval:3 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self changeData];
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:t forMode:NSRunLoopCommonModes];
    /*dispatch_async(dispatch_get_global_queue(0, 0), ^{
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
     [self changeData];
     });
     });*/
    /*dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self changeData];
    });*/
    //[self performSelector:@selector(changeData) withObject:nil afterDelay:3];
}

- (void)changeData
{
    self.data = @[@"change 1",
                  @"change 2",
                  @"change 3",
                  @"change 4",
                  @"change 5",
                  @"change 6",
                  @"change 7",
                  @"change 8",
                  @"change 9",
                  @"change 10",
                  @"change 11",
                  @"change 12",
                  ];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    [cell setText:self.data[indexPath.row]];
    return cell;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)testA
{

}

@end
