//
//  ViewController.m
//  Quotations
//
//  Created by tstone10 on 5/24/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

@end

@implementation ViewController
NSArray *quotes;
NSTimer *myTimer;


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
	//http://deceth.com/27-confucius-say-quotes-that-are-actually-funny/
	quotes = @[@{@"quote":@"Man who not poop for many days must take care of back log.",
				@"textColor":[UIColor darkGrayColor],
				@"backgroundColor":[UIColor yellowColor]},
			   @{@"quote":@"Man who run in front of car get tired. Man who run behind car get exhausted.",
				@"textColor":[UIColor redColor],
				@"backgroundColor":[UIColor lightGrayColor]},
			   @{@"quote":@"War not determine who is right, war determine who is left.",
				 @"textColor":[UIColor orangeColor],
				 @"backgroundColor":[UIColor blackColor]},
			   @{@"quote":@"Man who drive like hell, bound to get there.",
				 @"textColor":[UIColor yellowColor],
				 @"backgroundColor":[UIColor darkGrayColor]},
			   @{@"quote":@"Man who sit on tack get point!",
				 @"textColor":[UIColor blueColor],
				 @"backgroundColor":[UIColor whiteColor]},
			   @{@"quote":@"Man who jump off cliff, jump to conclusion!",
				 @"textColor":[UIColor greenColor],
				 @"backgroundColor":[UIColor purpleColor]},
			   @{@"quote":@"Man stuck in pantry have ass in jam.",
				 @"textColor":[UIColor cyanColor],
				 @"backgroundColor":[UIColor magentaColor]},
			   @{@"quote":@"Man who stand on toilet high on pot.",
				 @"textColor":[UIColor whiteColor],
				 @"backgroundColor":[UIColor brownColor]},];
	
	[self startQuoteTimer];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)startQuoteTimer {
	myTimer = [NSTimer scheduledTimerWithTimeInterval:5.0
						target:self
						selector:@selector(quoteTick)
						userInfo:nil
						repeats:YES];
}

- (void)quoteTick {
	NSDictionary *currentQuote = [self getRandomDictionaryFromArray];
	_quoteLabel.text = currentQuote[@"quote"];
	_quoteLabel.textColor = currentQuote[@"textColor"];
	self.view.backgroundColor = currentQuote[@"backgroundColor"];
}

-(NSDictionary *)getRandomDictionaryFromArray {
	
	UInt32 arrayCount = (UInt32)quotes.count;
	UInt32 unsignedRandomNum = arc4random_uniform(arrayCount);
	int randomNumber = (int)unsignedRandomNum;
	
	NSDictionary *randomQuote = quotes[randomNumber];
	
	return randomQuote;
}


@end
