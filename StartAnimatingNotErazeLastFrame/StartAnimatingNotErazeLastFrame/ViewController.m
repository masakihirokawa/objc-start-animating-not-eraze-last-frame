//
//  ViewController.m
//  StartAnimatingNotErazeLastFrame
//
//  Created by 廣川政樹 on 2013/04/19.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//アニメーションのフレームレート
float const _animationFps = 24.0f;
//アニメーションのリピート回数を無限に指定
NSInteger _animationRepeatNum = 1;
//アニメーションの座標・寸法指定
NSInteger _animationImageX;
NSInteger _animationImageY;
NSInteger const _animationImageWidth = 85;
NSInteger const _animationImageHeight = 120;

- (void)viewDidLoad
{
  [super viewDidLoad];
  //アニメーション開始
	[self startAnimationImage];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

//アニメーション開始
- (void)startAnimationImage
{
  //クラス初期化
  FrameByFrameAnimation *fbfAnimation = [[FrameByFrameAnimation alloc] init];
  //アニメーションの総フレーム数
  NSInteger animationFrames = 14;
  //アニメーションファイルの接頭詞
  NSString *animationPrefix = @"frame";
  //アニメーションをセンターに配置
  NSInteger _animationImageX = (self.view.frame.size.width / 2) - (_animationImageWidth / 2);
  NSInteger _animationImageY = (self.view.frame.size.height / 2) - (_animationImageHeight / 2);
  //アニメーション開始
  [fbfAnimation setAnimating:animationFrames
                            :animationPrefix
                            :[self animationSeconds:animationFrames]
                            :_animationRepeatNum
                            :_animationImageX
                            :_animationImageY
                            :_animationImageWidth
                            :_animationImageHeight];
  //ステージに追加
  [self.view addSubview:[fbfAnimation animationImageView]];
}

//アニメーション秒数を取得
- (float)animationSeconds:(NSInteger)animationFrames
{
  return (animationFrames / _animationFps);
}

@end
