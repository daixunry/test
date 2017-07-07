//
//  PDRepeatRecommendView.m
//  Temp
//
//  Created by daixu on 16/9/18.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "PDRepeatRecommendView.h"
#import "PDRepeatRecommendLayout.h"

//**************************************************//
//PDRepeatRecommendItemCell
//**************************************************//
static NSString *kPDRepeatRecommendCellReuseIdentifier = @"PDRepeatRecommendCellReuseIdentifier";
@interface PDRepeatRecommendItemCell : UICollectionViewCell
#warning 测试
- (void)setWithModel:(id)model;

@end

//**************************************************//
//PDRepeatRecommendView
//**************************************************//

static const NSInteger kPDRepeatRecommendCellNumPerPage = 6;//每页的cell数量

@interface PDRepeatRecommendView () <UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *contentView;

@property (nonatomic, strong) PDRepeatRecommendLayout *layout;

@property (nonatomic, strong) UIPageControl *pageControl;

//原始数据
@property (nonatomic, strong) NSArray *itemArray;

//逻辑上最后一屏数据
@property (nonatomic, strong) NSArray *lastPageItemArray;

//逻辑上第一屏数据
@property (nonatomic, strong) NSArray *firstPageItemArray;

//section的数量
@property (nonatomic, assign) NSInteger sectionNum;

//page的数量
@property (nonatomic, assign) NSInteger pageNum;

@end

@implementation PDRepeatRecommendView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.contentView];
        [self addSubview:self.pageControl];
        self.height = 80 + self.layout.collectionHeight +20;
    }
    return self;
}

//循环滚动的实现方案:
//1、把逻辑上的最后一屏的数据添加到第一屏，把逻辑上的第一屏数据添加到最后一屏，比如原始数据是排列是：1－2-3-4，修改后为4-1-2-3-4-1
//2、当在第一屏向右滑动的时候，最后一屏数据显示，这时，无动画改变offset到倒数第二屏（如上所示的位置4）
//3、如果从第一屏一直往左滑动，到最后一屏1的时候，无动画改变offset切到第二屏（如上所示的位置1）
//
//如果不足一屏，那么不需要特殊处理
- (void)handleItemArray
{
    self.pageNum = ceil(self.itemArray.count/(CGFloat)kPDRepeatRecommendCellNumPerPage);
    self.sectionNum = self.pageNum;
    if (self.pageNum > 1) {
        self.pageControl.hidden = NO;
        self.pageControl.numberOfPages = self.pageNum;
        self.sectionNum += 2;
        
        //抽取逻辑上的最后一屏的数据
        NSMutableArray *lastPageData = [NSMutableArray array];
        for (NSInteger i = (self.pageNum - 1)*kPDRepeatRecommendCellNumPerPage; i<self.itemArray.count; i++) {
            [lastPageData addObject:self.itemArray[i]];
        }
        self.lastPageItemArray = [NSArray arrayWithArray:lastPageData];
        
        //抽取逻辑上的第一屏数据
        self.firstPageItemArray = [self.itemArray subarrayWithRange:NSMakeRange(0, 6)];
    } else {
        self.pageControl.hidden = YES;
    }
}

- (void)renderUIWithProductModel:(NewProductModel *)model
{
#warning test data
    self.itemArray = @[@{@"text":@"1.1"},
                       @{@"text":@"1.2"},
                       @{@"text":@"1.3"},
                       @{@"text":@"1.4"},
                       @{@"text":@"1.5"},
                       @{@"text":@"1.6"},
                       @{@"text":@"2.1"},
                       @{@"text":@"2.2"},
                       @{@"text":@"2.3"},
                       @{@"text":@"2.4"},
                       @{@"text":@"2.5"},
                       @{@"text":@"2.6"},
                       @{@"text":@"3.1"},
                       @{@"text":@"3.2"},
                       @{@"text":@"3.3"},
                       @{@"text":@"3.4"},
                       @{@"text":@"3.5"},
                       @{@"text":@"3.6"},
                       @{@"text":@"4.1"}];
    [self handleItemArray];
    [self.contentView reloadData];
    if (self.sectionNum > 1) {
        [self.contentView setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];
    }
}

//没有数据情况下的处理
- (void)haveNoDataHandle
{
#warning wait handle
}

//请求超时或者异常处理
- (void)requestErrorHandle
{
#warning wait handle
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //两种布局方式，1：单屏；2:多屏
    if (self.sectionNum == 1) {
        return self.itemArray.count;
    } else {
        if (section == 0 || section == self.sectionNum - 2) {
            return self.lastPageItemArray.count;
        }
        return kPDRepeatRecommendCellNumPerPage;
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PDRepeatRecommendItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPDRepeatRecommendCellReuseIdentifier forIndexPath:indexPath];
    //两种布局方式，1：单屏；2:多屏
    if (self.sectionNum == 1) {
        [cell setWithModel:[self.itemArray objectAtIndex:indexPath.row]];
    } else {
        if (indexPath.section == 0 || indexPath.section == self.sectionNum - 2) {
            [cell setWithModel:[self.lastPageItemArray objectAtIndex:indexPath.row]];
        } else if(indexPath.section == self.sectionNum - 1) {
            [cell setWithModel:[self.firstPageItemArray objectAtIndex:indexPath.row]];
        } else {
            NSInteger dataIndex = (indexPath.section - 1)*kPDRepeatRecommendCellNumPerPage + indexPath.row;
            [cell setWithModel:self.itemArray[dataIndex]];
        }
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sectionNum;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    scrollView.scrollEnabled = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.sectionNum == 1) {
        return;
    }
    //当在第一屏向右滑动的时候，最后一屏数据显示，这时，无动画改变offset到倒数第二屏（如上所示的位置4）
    if (scrollView.contentOffset.x == 0) {
        [scrollView setContentOffset:CGPointMake((self.sectionNum - 2)*SCREEN_WIDTH, 0)];
        self.pageControl.currentPage = self.pageNum - 1;
    } else if (scrollView.contentOffset.x == (self.sectionNum - 1)*SCREEN_WIDTH) {
        //如果从第一屏一直往左滑动，到最后一屏1的时候，无动画改变offset切到第二屏（如上所示的位置1）
        [scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];
        self.pageControl.currentPage = 0;
    } else {
        self.pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x/SCREEN_WIDTH) - 1;
    }
    scrollView.scrollEnabled = YES;
}

#pragma mark - getter,setter
- (UICollectionView *)contentView
{
    if (!_contentView) {
        _contentView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.layout.collectionHeight) collectionViewLayout:self.layout];
        _contentView.delegate = self;
        _contentView.dataSource = self;
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.pagingEnabled = YES;
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
        [_contentView registerClass:[PDRepeatRecommendItemCell class] forCellWithReuseIdentifier:kPDRepeatRecommendCellReuseIdentifier];
    }
    return _contentView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.contentView.bottom, SCREEN_WIDTH, 20)];
    }
    return _pageControl;
}

- (PDRepeatRecommendLayout *)layout
{
    if (!_layout) {
        _layout = [[PDRepeatRecommendLayout alloc] init];
    }
    return _layout;
}

@end


@implementation PDRepeatRecommendItemCell

#warning 测试
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self temp];
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)setWithModel:(id)model
{
    UILabel *la = [self viewWithTag:100];
    la.text = model[@"text"];
    
}

- (void)temp
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    label.text = @"";
    label.tag = 100;
    [self addSubview:label];
}

@end
