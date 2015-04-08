//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  The MIT License
//  Copyright (c) 2014 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "AppDelegate.h"
#import "JSQSystemSoundPlayer.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[self.soundCheckbox bind: @"state"
					toObject: [JSQSystemSoundPlayer sharedPlayer]
				 withKeyPath: @"on"
					 options: nil];
}

#pragma mark - Actions

- (IBAction)playSystemSoundPressed:(NSButton *)sender
{
	JSQSystemSoundPlayer *sharedPlayer = [JSQSystemSoundPlayer sharedPlayer];

	[sharedPlayer playSoundWithFilename:@"Basso"
						  fileExtension:kJSQSystemSoundTypeAIF
							 completion:^{
								 NSLog(@"Sound finished playing. Executing completion block...");
							 }];
}

- (IBAction)playAlertSoundPressed:(NSButton *)sender
{
	[[JSQSystemSoundPlayer sharedPlayer] playAlertSoundWithFilename:@"Funk"
													  fileExtension:kJSQSystemSoundTypeAIFF];
}

- (IBAction)playLongSoundPressed:(NSButton *)sender
{
	NSLog(@"Playing long sound...");
	[[JSQSystemSoundPlayer sharedPlayer] playSoundWithFilename:@"BalladPiano"
												 fileExtension:kJSQSystemSoundTypeCAF
													completion:^{
														NSLog(@"Long sound complete!");
													}];
}

- (IBAction)stopPressed:(NSButton *)sender
{
	[[JSQSystemSoundPlayer sharedPlayer] stopAllSounds];

	//  Stop playing specific sound
	//  [[JSQSystemSoundPlayer sharedPlayer] stopSoundWithFilename:@"BalladPiano"];
}

- (IBAction)toggleSwitch:(NSButton *)sender
{
	[[JSQSystemSoundPlayer sharedPlayer] toggleSoundPlayerOn:sender.state];
}

@end
