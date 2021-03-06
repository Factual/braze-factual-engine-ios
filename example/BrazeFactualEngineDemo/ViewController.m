/*
 * Use of this software is subject to the terms and
 * conditions of the license agreement between you
 * and Factual Inc
 *
 * Copyright © 2019 Factual Inc. All rights reserved.
 */

#import "BButton.h"
#import "EngineDelegate.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self addDetectButton];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)addDetectButton {
  [[BButton appearance] setButtonCornerRadius:@40.0f];
  
  CGRect frame = CGRectMake(0.0f, 0.0f, 250.0f, 75.0f);
  BButton *btn = [[BButton alloc] initWithFrame:frame
                                           type:BButtonTypePurple
                                          style:BButtonStyleBootstrapV3];
  [btn setTitle:@"Impatient? Detect location now!" forState:UIControlStateNormal];
  [btn addTarget:self action:@selector(detectAnyCircumstancesAndTrack:) forControlEvents:UIControlEventTouchUpInside];
  btn.enabled = YES;
  btn.center = self.view.center;
  [self.view addSubview:btn];
}

- (void)detectAnyCircumstancesAndTrack:(UIButton *)sender {
  NSLog(@"Triggered!");
  [[EngineDelegate engine] runCircumstances];
}
@end
