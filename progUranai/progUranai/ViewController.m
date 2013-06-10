//
//  ViewController.m
//  progUranai
//
//  Created by kazuyoshi kawakami on 13/06/10.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    for ( int i = 0; i < 12; i++) {
        NSString *file = [NSString stringWithFormat:@"IC%03d", i + 1];
        NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:@"png"];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        images[i] = image;
    }
    self.imageView.image = images[0];

    // 占いテキストセット
    uranai[0] = @"ラッキーカラーは青";
    uranai[1] = @"ラッキーな場所は神社";
    uranai[2] = @"ラッキーなアイテムはiPhone";
    uranai[3] = @"ラッキーな人はほがらか";
    uranai[4] = @"ラッキーな食べ物はフランスパン";
    uranai[5] = @"ラッキーな動物はかびぱら";
    uranai[6] = @"ラッキーなアイスはあずきバー";
    uranai[7] = @"ラッキーなお菓子はチョコレート";
    uranai[8] = @"ラッキーな人はおばあさん";
    uranai[9] = @"ラッキーな古典は親和力";
    uranai[10] = @"ラッキーな漫画はワンピース";
    uranai[11] = @"ラッキーな言語はObject-C";
    
    //
    self.buttonStop.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageView release];
    [_labelResult release];
    [_buttonStop release];
    [_buttonStart release];
    [super dealloc];
}
- (IBAction)clickStart:(id)sender {
    srand(time(nil));
    imageIndex = rand() % 12;
    self.imageView.image = images[imageIndex];
    tm = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
    self.buttonStart.hidden = YES;
    self.buttonStop.hidden = NO;
}

- (IBAction)clickStop:(id)sender {
    double time = (rand() % 30 ) * 0.1;
    tm2 = [NSTimer
           scheduledTimerWithTimeInterval:time
           target:self
           selector:@selector(onStopTimer:)
           userInfo:nil
           repeats:NO
           ];
    self.buttonStop.hidden = YES;
    self.buttonStart.hidden = NO;
    self.labelResult.text = @"占い結果";
}

- (void)onTimer:(id)sender
{
    ++imageIndex;
    if ( imageIndex >= 12 ) {
        imageIndex = 0;
        self.imageView.image = images[imageIndex];
    }
}

- (void)onStopTimer:(id)sender
{
    [tm invalidate];
    startFlag = false;
    self.labelResult.text = uranai[imageIndex];
}

@end
