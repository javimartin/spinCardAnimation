//
//  ViewController.h
//  spinTest2
//
//  Created by Javier Martin on 8/10/12.
//  Copyright (c) 2012 Javier Martin de Valmaseda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h> 

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *cardFront;

- (IBAction)buttonPressed:(id)sender;
@end
