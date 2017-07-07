//
//  PDPepeatRecommendLayout.m
//  Temp
//
//  Created by daixu on 16/9/19.
//  Copyright © 2016年 daixu. All rights reserved.
//

#import "PDPepeatRecommendLayout.h"

#warning test temp data
static const CGFloat kPDRepeatRecommendCellVerticalSpacing = 3.0f;//cell的垂直间距
static const CGFloat kPDRepeatRecommendCellHorizontalSpacing = 0;//cell的水平间距
static const CGFloat kPDRepeatRecommendCellFirstX = 1.0f;//cell的初始x

@interface PDPepeatRecommendLayout ()

//cell的宽度
@property (nonatomic, assign) CGFloat cellWidth;

//cell的高度
@property (nonatomic, assign) CGFloat cellHeight;

@end

@implementation PDPepeatRecommendLayout

- (void)prepareLayout
{
    //self.cellWidth = (self.frame.size.width - 2*kPDRepeatRecommendCellFirstX - 2*kPDRepeatRecommendCellHorizontalSpacing)/3.0;
#warning test temp data
    //self.cellHeight = self.cellWidth + 60;
    //self.collectionView.height = 2*self.cellHeight+kPDRepeatRecommendCellVerticalSpacing + 20;
}
/*
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{

}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{

}*/

@end
