//
//  ViewController.m
//  PushingButtonShownTheText
//
//  Created by ammar falmban on 6/11/14.
//  Copyright (c) 2014 devAspirant.wordpress.com. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;

//
@property(strong,nonatomic)AVAudioPlayer *audioPlayer;

// Defintaion the time for playing the sound
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.myLabel.text = @"";
    [self.myButton setTitle:@"Show the Label" forState:UIControlStateNormal];
    self.myLabel.tag = 0;
    self.myLabel.tag++;
    self.view.backgroundColor = [UIColor whiteColor];
    
    // RUN the Sound File
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"Daylight" ofType:@"mp3"]];
    
    NSLog(@"%@",url);
    
    NSError *error;
    
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    if(error){
        NSLog(@"Error inAudio : %@",[error localizedDescription]);
        
    }else{
        self.audioPlayer.delegate = self;
        [self.audioPlayer prepareToPlay];
    }
    
    
}
- (IBAction)Show:(id)sender {
    if(self.myLabel.tag == 1 ){
        //self.myLabel.tag = 1;
    self.myLabel.text = @"Hello";
                NSLog(@"Tag:%ld",(long)self.myLabel.tag);
        self.myLabel.tag++;

    }
    else if(self.myLabel.tag == 2){
        self.myLabel.text = @"NextView";
            NSLog(@"Tag:%ld",(long)self.myLabel.tag);
        [self.audioPlayer play];
    
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
