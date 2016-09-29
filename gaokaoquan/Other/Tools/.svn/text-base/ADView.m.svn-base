//
//  ADView.h
//  ChinaMall
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 Nevis. All rights reserved.
//

#import "ADView.h"

@interface ADView ()<UIScrollViewDelegate>
{
    __block void(^_callBack)();
}

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, assign) NSInteger totalPage;

@end

@implementation ADView


-(instancetype)initWithFrame:(CGRect)frame withImageArray:(NSArray *)imageArray goBack:(void(^)())handler
{
    if (self = [super initWithFrame:frame]) {
        
        _callBack = handler;
        [self createSubViews:imageArray];
    }
    return self;
}

-(void)createSubViews:(NSArray *)imageArray
{
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;

        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 50, self.frame.size.width, 30)];
        _pageControl.currentPageIndicatorTintColor = [UIColor cyanColor];
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.backgroundColor = [UIColor clearColor];
        _scrollView.pagingEnabled = YES;
        _pageControl.numberOfPages = [imageArray count];
        
        [_pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_scrollView];
        //[self addSubview:_pageControl];
    }
    _scrollView.contentSize = CGSizeMake(self.frame.size.width * [imageArray count], self.frame.size.height);
    //移除已有的图片
    for (UIImageView *imageView in _scrollView.subviews)
    {
        [imageView removeFromSuperview];
    }
    
    NSInteger i = 0;
    for (NSString *imageName in imageArray)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        imageView.image = [UIImage imageNamed:imageName];
        [_scrollView addSubview:imageView];
        i++;
    }
    _totalPage = imageArray.count;
}

-(void)pageChanged:(UIPageControl *)pageContl
{
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width * pageContl.currentPage, 0);
    if (pageContl.currentPage == _totalPage - 1) {
        if (_callBack) {
            _callBack();
        }
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger pageCount = scrollView.contentOffset.x/_scrollView.frame.size.width;
    _pageControl.currentPage = pageCount;
    if (pageCount == _totalPage - 1) {
        if (_callBack) {
            _callBack();
        }
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
