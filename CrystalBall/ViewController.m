//
//  ViewController.m
//  CrystalBall
//
//  Created by Bruce Ackerman on 1/20/13.
//  Copyright (c) 2013 Bruce Ackerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// creates getter & setter's for this variable
// basically makes it so you can use this in the view 
@synthesize predictionArray;
@synthesize predictionLabel;

- (void)viewDidLoad // stuff that loads online once
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set the background image
    UIImage *image = [UIImage imageNamed:@"bg.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view insertSubview:imageView atIndex:0];
    
    // 8 options
    self.predictionArray = [[NSArray alloc] initWithObjects:@"It is certain",
        @"It is decidely so",
        @"All signs say yes",
        @"The stars are not aligned",
        @"My reply is no",
        @"Better not tell you now",
        @"Concentrate and ask again",
        @"Unable to answer now", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
//    NSString *myString = @"My name is Bruce.";
//    [myString length];
//    [myString uppercaseString];
   
    [self makePrediction];
}

- (void) makePrediction{
    NSUInteger index = arc4random_uniform(self.predictionArray.count);
    self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
    
    // animate over 2 seconds
    [UIView animateWithDuration:2.0 animations:^{
        self.predictionLabel.alpha = 1.0;
    }];
    // ^ means it is a block
}

- (BOOL) canBecomeFirstResponder{
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0;
}
- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake){
        // if the motion that happened was a shake
        [self makePrediction];
    }
}
- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motion cancelled");
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0;    
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self makePrediction];
}
@end
