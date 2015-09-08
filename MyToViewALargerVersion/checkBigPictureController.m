//
//  checkBigPictureController.m
//  ToViewALargerVersion
//
//  Created by 高彬 on 15/9/8.
//  Copyright (c) 2015年 erweimashengchengqi. All rights reserved.
//

#import "checkBigPictureController.h"

#define ks_ScreenWidth self.view.frame.size.width
#define ks_ScreenHeight self.view.frame.size.height


@interface checkBigPictureController () {
    UIScrollView * bigImageScrollerView;
    UIImageView *_firstView;
    UIImageView *_secondView;
    UIImageView *_thirdView;
    
    int _index;//用来记录当前选中的图片的位置
    int _currentType;//记录当前的图片的状态
    int nowPoint;
}

@end

@implementation checkBigPictureController


-(void) viewDidLoad {
    
    nowPoint = self.checkInteger;
    _index = self.checkInteger;
    bigImageScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,ks_ScreenWidth , ks_ScreenHeight)];
    [bigImageScrollerView setContentSize:CGSizeMake(ks_ScreenWidth * self.pictureArray.count, ks_ScreenHeight)];
    [bigImageScrollerView setBackgroundColor:[UIColor whiteColor]];
    [bigImageScrollerView setPagingEnabled:YES];
    bigImageScrollerView.delegate = self;
    bigImageScrollerView.showsHorizontalScrollIndicator = NO;
    bigImageScrollerView.pagingEnabled = YES;
    [self.view addSubview:bigImageScrollerView];
    //判断图片数组的个数
    if (self.pictureArray.count-1 !=0) {
        //如果数组的图片大于1
        if (self.checkInteger==0) {
            //点击的位置是第一个
            _currentType = 0;
            [self creatFirstView];
            
        } else if(self.checkInteger == self.pictureArray.count -1){
            //点击的位置是最后一个
            _currentType = 1;
            [self creatLastView];
        } else {
            //点击的位置是中间的某个
            _currentType = 2;
            [self creatIndexView];
        }
        //[self addMyPageControl];
        
    } else {
        //加入单独的图片View
        [self createSingView];
    }
    
}
/**
 *  scrollerView delegate
 */

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int pageIndex  = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth)+1;
    
    switch (_currentType) {
        case 0:
        {
            _index = _index + pageIndex;
            if (pageIndex == 1) {
                if (_index == self.pictureArray.count - 1) {
                    [self creatLastView];
                } else {
                    [self creatIndexView];
                }
            }
            nowPoint = nowPoint +1;
        }
            break;
        case 1:
        {
            _index = _index + pageIndex -1;
            if (pageIndex == 0) {
                if (_index == 0) {
                    [self creatFirstView];
                } else {
                    [self creatIndexView];
                }
            }
            nowPoint = nowPoint + pageIndex -1;
        }
            break;
            
        case 2:
        {
            _index = _index + pageIndex -1;
            if (_index == 0) {
                [self creatFirstView];
            } else if (_index == self.pictureArray.count -1) {
                [self creatLastView];
            } else {
                [self creatIndexView];
            }
            nowPoint = nowPoint + pageIndex -1;
        }
            break;
        default:
            break;
    }
    scrollView.userInteractionEnabled = YES;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    scrollView.userInteractionEnabled = NO;
}

//当点击中间的某一张图片
-(void) creatIndexView {
    //防止图片加载的显示重复现象
    [_firstView removeFromSuperview];
    [_secondView removeFromSuperview];
    [_thirdView removeFromSuperview];
    
    _firstView = nil;
    _secondView = nil;
    _thirdView = nil;
    
    _firstView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ks_ScreenWidth, ks_ScreenHeight)];
    [bigImageScrollerView addSubview:_firstView];
    //加载并缓存图片
    
    _secondView = [[UIImageView alloc]initWithFrame:CGRectMake(ks_ScreenWidth, 0, ks_ScreenWidth, ks_ScreenHeight)];
    [bigImageScrollerView addSubview:_secondView];
    //加载并缓存图片
    
    _thirdView = [[UIImageView alloc]initWithFrame:CGRectMake(ks_ScreenWidth * 2, 0, ks_ScreenWidth, ks_ScreenHeight)];
    [bigImageScrollerView addSubview:_thirdView];
    //加载并缓存图片
    
    bigImageScrollerView.contentSize = CGSizeMake(ks_ScreenWidth *3, ks_ScreenHeight);
    [bigImageScrollerView scrollRectToVisible:CGRectMake(ks_ScreenWidth, 0, ks_ScreenWidth, ks_ScreenHeight) animated:NO];
    _currentType = 2;
    
}

//当点击的图片是最后一个的时候
-(void)creatLastView {
    //防止图片加载的显示重复现象
    [_firstView removeFromSuperview];
    [_secondView removeFromSuperview];
    [_thirdView removeFromSuperview];
    
    _firstView = nil;
    _secondView = nil;
    _thirdView = nil;
    
    _firstView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ks_ScreenWidth, ks_ScreenHeight)];
    [bigImageScrollerView addSubview:_firstView];
    //加载图片并缓存图片
    
    _secondView = [[UIImageView alloc]initWithFrame:CGRectMake(ks_ScreenWidth, 0, ks_ScreenWidth, ks_ScreenHeight)];
    [bigImageScrollerView addSubview:_secondView];
    //加载图片并缓存图片
    
    
    
    bigImageScrollerView.contentSize = CGSizeMake(ks_ScreenWidth * 2, ks_ScreenHeight);
    [bigImageScrollerView scrollRectToVisible:CGRectMake(ks_ScreenWidth, 0, ks_ScreenWidth, ks_ScreenHeight) animated:NO];
    _currentType = 1;
}

//当点击的图片是第一个的时候
-(void)creatFirstView {
    //防止图片加载的显示重复现象
    [_firstView removeFromSuperview];
    [_secondView removeFromSuperview];
    [_thirdView removeFromSuperview];
    
    _firstView = nil;
    _secondView = nil;
    _thirdView = nil;
    
    _firstView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ks_ScreenWidth, ks_ScreenHeight)];
    [bigImageScrollerView addSubview:_firstView];
    //加载图片  并加入沙盒
    
    
    _secondView = [[UIImageView alloc]initWithFrame:CGRectMake(ks_ScreenWidth, 0, ks_ScreenWidth, ks_ScreenHeight)];
    [bigImageScrollerView addSubview:_secondView];
    //加载图片 并加入沙盒
    
    bigImageScrollerView.contentSize = CGSizeMake(ks_ScreenWidth * 2, ks_ScreenHeight);
    [bigImageScrollerView scrollRectToVisible:CGRectMake(0, 0, ks_ScreenWidth, ks_ScreenHeight) animated:NO];
    _currentType = 0;
}

-(void)createSingView {
    //创建单独的图片View
    
    //防止图片加载的显示重复现象
    [_firstView removeFromSuperview];
    [_secondView removeFromSuperview];
    [_thirdView removeFromSuperview];
    
    _firstView = nil;
    _secondView = nil;
    _thirdView = nil;
    
    
    //开始加载图片
    
    _firstView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ks_ScreenWidth, ks_ScreenHeight)];
    [bigImageScrollerView addSubview:_firstView];
    //加载图片  并加入缓存
    
    bigImageScrollerView.contentSize = CGSizeMake(0, 0);
    [bigImageScrollerView scrollRectToVisible:CGRectMake(0, 0, ks_ScreenWidth, ks_ScreenHeight) animated:NO];
    _currentType = 0;
    
}

//-(void) addMyPageControl {
//    
//}



























@end
