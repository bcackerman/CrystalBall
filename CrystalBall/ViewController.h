//
//  ViewController.h
//  CrystalBall
//
//  Created by Bruce Ackerman on 1/20/13.
//  Copyright (c) 2013 Bruce Ackerman. All rights reserved.
//

#import <UIKit/UIKit.h>

// name of class : name of parent class
@interface ViewController : UIViewController {

}

// basically initializing the variable
@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) NSArray *predictionArray;

- (IBAction)buttonPressed:(UIButton *)sender;

- (void) makePrediction;

@end
