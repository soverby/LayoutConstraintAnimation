//
//  SOFrameAnimationViewController.m
//  LayoutConstraintAnimation
//
//  Created by Overby, Sean on 10/26/13.
//  Copyright (c) 2013 Sean Overby. All rights reserved.
//

#import "SOFrameAnimationViewController.h"

@interface SOFrameAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fireAnimButton;
@property (strong, nonatomic) NSString *animText;
@property (strong, nonatomic) NSString *resetText;
@property (assign) int imgViewTag;
@end

@implementation SOFrameAnimationViewController

@synthesize imgViewTag = imgViewTag;
@synthesize animText = animText;
@synthesize resetText = resetText;

- (IBAction)fireAnimation:(id)sender {
    NSString *titleText = self.fireAnimButton.titleLabel.text;
    if([titleText isEqualToString:animText])
    {
        [self animate];
    } else
    {
        [self reset];
    }
}

- (void)animate
{
    self.fireAnimButton.userInteractionEnabled = NO;
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:imgViewTag];
    UIImage *img = imgView.image;
    CGRect newFrame = CGRectMake(self.view.frame.size.width / 2 - img.size.width / 2, 44, img.size.width, img.size.height);
    [UIView animateWithDuration:1.0 animations:^{
        imgView.frame = newFrame;
    } completion:^(BOOL finished) {
        self.fireAnimButton.titleLabel.text = resetText;
        self.fireAnimButton.userInteractionEnabled = YES;
    }];
}

- (void)reset
{
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:imgViewTag];
    UIImage *img = imgView.image;
    imgView.frame = CGRectMake(self.view.frame.size.width / 2 - img.size.width / 2, self.view.frame.size.height - 220, img.size.width, img.size.height);
    self.fireAnimButton.titleLabel.text = animText;

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
    imgViewTag = 552;
    animText = @"Fire Animation";
    resetText = @"Reset";
    
    UIImage *img = [UIImage imageNamed:@"doseq"];

    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.tag = imgViewTag;
    imgView.frame = CGRectMake(self.view.frame.size.width / 2 - img.size.width / 2, self.view.frame.size.height - 220, img.size.width, img.size.height);
    [self.view addSubview:imgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
