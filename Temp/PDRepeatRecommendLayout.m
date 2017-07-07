//
//  PDRepeatRecommendLayout.m
//  Temp
//
//  Created by daixu on 16/9/19.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "PDRepeatRecommendLayout.h"

#warning test temp data
static const CGFloat kPDRepeatRecommendCellVerticalSpacing = 2.0;//cell的垂直间距
static const CGFloat kPDRepeatRecommendCellHorizontalSpacing = 3.0;//cell的水平间距
static const CGFloat kPDRepeatRecommendCellFirstX = 1.0f;//cell的初始x

@interface PDRepeatRecommendLayout ()

//cell的宽度
@property (nonatomic, assign) CGFloat cellWidth;

//cell的高度
@property (nonatomic, assign) CGFloat cellHeight;

//根据section分开的二维数组
@property (nonatomic, strong) NSArray *attributeArr;

//collectionView content size
@property (nonatomic, assign) CGSize contentSize;

@property (nonatomic, assign) CGFloat collectionHeight;

@end

@implementation PDRepeatRecommendLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellWidth = (SCREEN_WIDTH - 2*kPDRepeatRecommendCellFirstX - 2*kPDRepeatRecommendCellHorizontalSpacing)/3.0;
#warning test temp data
        self.cellHeight = self.cellWidth + 60;
        self.collectionHeight = 2*self.cellHeight+kPDRepeatRecommendCellVerticalSpacing;
    }
    return self;
}

- (void)prepareLayout
{
    self.collectionView.height = self.collectionHeight;
    NSInteger sectionNum = [self.collectionView numberOfSections];
    NSMutableArray *allItemSec = [NSMutableArray array];
    for (NSInteger sectionIndex = 0; sectionIndex < sectionNum; sectionIndex++) {
        NSInteger itemNumInSection = [self.collectionView numberOfItemsInSection:sectionIndex];
        NSMutableArray *itemsSec = [NSMutableArray array];
        for (NSInteger itemIndex = 0; itemIndex < itemNumInSection; itemIndex++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:itemIndex inSection:sectionIndex];
            UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:indexPath];
            [itemsSec addObject:att];
        }
        
        [allItemSec addObject:itemsSec];
    }
    //存储布局信息
    self.attributeArr = [allItemSec copy];
    //保存内容尺寸
    self.contentSize = CGSizeMake(sectionNum*SCREEN_WIDTH, self.collectionView.height);
}

- (CGSize)collectionViewContentSize
{
    return self.contentSize;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layouts = [NSMutableArray array];
    [self.attributeArr enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger idx, BOOL * _Nonnull stop) {
        [array enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (CGRectIntersectsRect(obj.frame, rect)) {
                [layouts addObject:obj];
            }
        }];
    }];
    return layouts;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat cellX = kPDRepeatRecommendCellFirstX + (indexPath.row%3)*(self.cellWidth + kPDRepeatRecommendCellHorizontalSpacing) + SCREEN_WIDTH*indexPath.section;
    CGFloat cellY = (indexPath.row/3)*(self.cellHeight + kPDRepeatRecommendCellVerticalSpacing);
    attribute.frame = CGRectMake(cellX, cellY, self.cellWidth, self.cellHeight);

    return attribute;
}

@end
