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
@end

@implementation SOLayoutConstraintAnimationViewController

@synthesize fireAnimButton = fireAnimButton;
@synthesize verticalImgConstraints = verticalImgConstraints;

int imgViewTag = 552;

- (IBAction)fireAnimation:(id)sender {
    [self.view removeConstraints:verticalImgConstraints];
    UIImageView *imgView = (UIImageView *) [self.view viewWithTag:imgViewTag];
    NSDictionary *views = NSDictionaryOfVariableBindings(imgView, fireAnimButton);
    NSDictionary *metrics = @{@"bottomPadding":@10.0};
    
    verticalImgConstraints = [NSLayoutConstraint
                              constraintsWithVisualFormat:@"V:|-[imgView]"
                              options:0 metrics:metrics views:views];
    [self.view addConstraints:verticalImgConstraints];
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
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