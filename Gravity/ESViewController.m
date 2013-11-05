//
//  ESViewController.m
//  Gravity
//
//  Created by Eduardo Sierra on 11/1/13.
//  Copyright (c) 2013 Sierra. All rights reserved.
//

#import "ESViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ESViewController () <UICollisionBehaviorDelegate>
{
    bool popBubble;
}

@end

UIDynamicAnimator *_animator;
UIGravityBehavior *_gravity;
UICollisionBehavior *_collision;


@implementation ESViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    CGRect theRect = CGRectMake(100, 100, 50, 50);
    
    UIView *circle = [[UIView alloc] initWithFrame:theRect];
    circle.backgroundColor = [UIColor grayColor];
    circle.alpha = 0.5;
    circle.layer.cornerRadius = 25;
    circle.clipsToBounds = YES;
    circle.tag = 1;
    [self.view addSubview:circle];
    
    UIView *circle1 = [[UIView alloc] initWithFrame:theRect];
    circle1.backgroundColor = [UIColor blueColor];
    circle1.alpha = 0.5;
    circle1.layer.cornerRadius = 25;
    circle1.clipsToBounds = YES;
    [self.view addSubview:circle1];
    
    UIView *circle2 = [[UIView alloc] initWithFrame:theRect];
    circle2.backgroundColor = [UIColor whiteColor];
    circle2.alpha = 0.5;
    circle2.layer.cornerRadius = 25;
    circle2.clipsToBounds = YES;
    [self.view addSubview:circle2];
    
    UIView *circle3 = [[UIView alloc] initWithFrame:theRect];
    circle3.backgroundColor = [UIColor yellowColor];
    circle3.alpha = 0.5;
    circle3.layer.cornerRadius = 25;
    circle3.clipsToBounds = YES;
    [self.view addSubview:circle3];
    
    UIView *circle4 = [[UIView alloc] initWithFrame:theRect];
    circle4.backgroundColor = [UIColor orangeColor];
    circle4.alpha = 0.5;
    circle4.layer.cornerRadius = 25;
    circle4.clipsToBounds = YES;
    [self.view addSubview:circle4];
    
    UIView *circle5 = [[UIView alloc] initWithFrame:theRect];
    circle5.backgroundColor = [UIColor redColor];
    circle5.alpha = 0.5;
    circle5.layer.cornerRadius = 25;
    circle5.clipsToBounds = YES;
    [self.view addSubview:circle5];
    
    UIView *circle6 = [[UIView alloc] initWithFrame:theRect];
    circle6.backgroundColor = [UIColor greenColor];
    circle6.alpha = 0.5;
    circle6.layer.cornerRadius = 25;
    circle6.clipsToBounds = YES;
    [self.view addSubview:circle6];
    
    UIView *circle7 = [[UIView alloc] initWithFrame:theRect];
    circle7.backgroundColor = [UIColor brownColor];
    circle7.alpha = 0.5;
    circle7.layer.cornerRadius = 25;
    circle7.clipsToBounds = YES;
    [self.view addSubview:circle7];
    
    UIView *circle8 = [[UIView alloc] initWithFrame:theRect];
    circle8.backgroundColor = [UIColor magentaColor];
    circle8.alpha = 0.5;
    circle8.layer.cornerRadius = 25;
    circle8.clipsToBounds = YES;
    [self.view addSubview:circle8];
    
    [UIView setAnimationRepeatAutoreverses:YES];
    
    

    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[circle, circle1, circle2, circle3, circle4, circle5, circle6, circle7, circle8]];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[circle, circle1, circle2, circle3, circle4, circle5, circle6, circle7, circle8]];
    
    
    _collision.collisionDelegate = self;
    
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
    
    _collision.action = ^{
        NSLog(@"%@, %@",
              NSStringFromCGAffineTransform(circle.transform),
              NSStringFromCGPoint(circle.center));
    };
    

    UIDynamicItemBehavior* bubble = [[UIDynamicItemBehavior alloc] initWithItems:@[circle, circle1, circle2, circle3, circle4, circle5, circle6, circle7, circle8]];
    bubble.elasticity = 1.1;
    [_animator addBehavior:bubble];
    
    
    UITapGestureRecognizer *bubbleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBubble:)];
    [self.view addGestureRecognizer:bubbleTap];
    
}

- (void)handleBubble:(UITapGestureRecognizer *)recognizer
{
    for (UIView *subview in [recognizer.self.view subviews]) {
        [recognizer.self.view.superview addSubview:subview];
    }
    [recognizer.self.view removeFromSuperview];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
