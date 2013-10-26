//
//  SOFrameAnimationViewController.m
//  LayoutConstraintAnimation
//
//  Created by Overby, Sean on 10/26/13.
//  Copyright (c) 2013 Sean Overby. All rights reserved.
//

#import "SOFrameAnimationViewController.h"

@interface SOFrameAnimationViewController ()

@end

@implementation SOFrameAnimationViewController

int imgTag = 557;

- (IBAction)fireAnimation:(id)sender {
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:imgTag];
    UIImage *img = imgView.image;
    CGRect newFrame = CGRectMake(self.view.frame.size.width / 2 - img.size.width / 2, 44, img.size.width, img.size.height);
    [UIView animateWithDuration:1.0 animations:^{
        imgView.frame = newFrame;
    } completion:^(BOOL finished) {
        //
    }];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *img = [UIImage imageNamed:@"doseq"];

    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.tag = imgTag;
    imgView.frame = CGRectMake(self.view.frame.size.width / 2 - img.size.width / 2, self.view.frame.size.height - 220, img.size.width, img.size.height);
    NSLog(@" imgView.frame: x: %f, y: %f, h: %f, w: %f", imgView.frame.origin.x, imgView.frame.origin.y, imgView.frame.size.height, imgView.frame.size.width);
    [self.view addSubview:imgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
