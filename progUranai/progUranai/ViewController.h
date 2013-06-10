//
//  ViewController.h
//  progUranai
//
//  Created by kazuyoshi kawakami on 13/06/10.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIImage *images[12];
    NSString *uranai[12];
    int imageIndex;
    NSTimer *tm;
    NSTimer *tm2;
    bool startFlag;
}

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UILabel *labelResult;
- (IBAction)clickStart:(id)sender;
- (IBAction)clickStop:(id)sender;
- (void) onTimer:(id)sender;
- (void) onStopTimer:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *buttonStop;
@property (retain, nonatomic) IBOutlet UIButton *buttonStart;

@end
