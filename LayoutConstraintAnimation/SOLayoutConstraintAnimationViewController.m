//
//  SOLayoutConstraintAnimationViewController.m
//  LayoutConstraintAnimation
//
//  Created by Overby, Sean on 10/26/13.
//  Copyright (c) 2013 Sean Overby. All rights reserved.
//

#import "SOLayoutConstraintAnimationViewController.h"

@interface SOLayoutConstraintAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fireAnimButton;
@property (strong, nonatomic) NSArray *verticalImgConstraints;
@property (strong, nonatomic) NSString *animText;
@property (strong, nonatomic) NSString *resetText;
@property (assign) int imgViewTag;
@end

@implementation SOLayoutConstraintAnimationViewController

@synthesize fireAnimButton = fireAnimButton;
@synthesize verticalImgConstraints = verticalImgConstraints;
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
    // Make sure we remove the constraints we're going to alter in the animation first
    [self.view removeConstraints:verticalImgConstraints];
    // Get the image view
    UIImageView *imgView = (UIImageView *) [self.view viewWithTag:imgViewTag];
    // Setup our vews and metrics - I'm not using the metrics just yet but
    // I will later on so just leave it here.
    NSDictionary *views = NSDictionaryOfVariableBindings(imgView, fireAnimButton);
    NSDictionary *metrics = @{@"bottomPadding":@10.0};
    // Animate from where it was to the top of its superview with standard padding
    verticalImgConstraints = [NSLayoutConstraint
                              constraintsWithVisualFormat:@"V:|-[imgView]"
                              options:0 metrics:metrics views:views];
    [self.view addConstraints:verticalImgConstraints];
    
    [UIView animateWithDuration:1.0 animations:^{
        // All we have to do now is call layoutIfNeeded
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.fireAnimButton.titleLabel.text = resetText;
        self.fireAnimButton.userInteractionEnabled = YES;
    }];
}

- (void)reset
{
    [self.view removeConstraints:verticalImgConstraints];
    UIImageView *imgView = (UIImageView *) [self.view viewWithTag:imgViewTag];
    // Setup our vews and metrics - I'm not using the metrics just yet but
    // I will later on so just leave it here.
    NSDictionary *views = NSDictionaryOfVariableBindings(imgView, fireAnimButton);
    
    // Vertical Constraint - pin it right above the fire animation button
    verticalImgConstraints = [NSLayoutConstraint
                              constraintsWithVisualFormat:@"V:[imgView]-[fireAnimButton]"
                              options:0 metrics:nil views:views];
    [self.view addConstraints:verticalImgConstraints];
    [self.view layoutIfNeeded];
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
    
    imgViewTag = 552;
    animText = @"Fire Animation";
    resetText = @"Reset";
    
	// Do any additional setup after loading the view.
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"doseq"]];
    imgView.tag = imgViewTag;
    imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:imgView];
    NSDictionary *views = NSDictionaryOfVariableBindings(imgView, fireAnimButton);
    
    // Horizontal - we want center X so we can't use VFL
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:imgView
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0]];
    // Vertical Constraint - pin it right above the fire animation button
    verticalImgConstraints = [NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[imgView]-[fireAnimButton]"
                               options:0 metrics:nil views:views];
    [self.view addConstraints:verticalImgConstraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
