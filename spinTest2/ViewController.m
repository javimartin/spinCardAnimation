//
//  ViewController.m
//  spinTest2
//
//  Created by Javier Martin on 8/10/12.
//  Copyright (c) 2012 Javier Martin de Valmaseda. All rights reserved.
//

#import "ViewController.h"

// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface ViewController ()
- (void)moveImage:(UIImageView *)image duration:(NSTimeInterval)duration
            curve:(int)curve x:(CGFloat)x y:(CGFloat)y;

- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration
              curve:(int)curve degrees:(CGFloat)degrees;
- (void) runSpinAnimationWithDuration:(UIImageView *)image
                         withDuration:(CGFloat) duration;
- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
@end

@implementation ViewController;
@synthesize cardFront;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)buttonPressed:(id)sender {
    
    
    UIImageView *imageToMove =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card-front.png"]];
    imageToMove.frame = CGRectMake(10, 10, 20, 100);
    [self.view addSubview:imageToMove];
    
    //[self rotateImage:imageToMove duration:3.0
                //curve:UIViewAnimationCurveEaseIn degrees:180];
    
    [self runSpinAnimationOnView:imageToMove duration:1.f rotations:5.0 repeat:1.0];
    //[self runSpinAnimationWithDuration:imageToMove
                       //   withDuration:3.0];
    
    
    //move image
   /* UIImageView *imageToMove =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card-front.png"]];
    //UIImageView *imageToMove = self.card;
    //imageToMove.hidden = NO;
    imageToMove.frame = CGRectMake(10, 10, 20, 100);
    [self.view addSubview:imageToMove];
    
    // Move the image
    [self moveImage:imageToMove duration:3.0
              curve:UIViewAnimationCurveLinear x:50.0 y:50.0];*/
    
}


- (void)moveImage:(UIImageView *)image duration:(NSTimeInterval)duration
            curve:(int)curve x:(CGFloat)x y:(CGFloat)y
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform = CGAffineTransformMakeTranslation(x, y);
    image.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
    
}

- (void)rotateImage:(UIImageView *)image duration:(NSTimeInterval)duration
              curve:(int)curve degrees:(CGFloat)degrees
{
    // Setup the animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:curve];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    // The transform matrix
    CGAffineTransform transform =
    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(degrees));
    image.transform = transform;
    
    // Commit the changes
    [UIView commitAnimations];
}
- (void) runSpinAnimationWithDuration:(UIImageView *)image
                           withDuration:(CGFloat) duration
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 5.0 * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1.0;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [image.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}



@end
