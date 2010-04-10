//
//  WallPaperAppDelegate.h
//
//  Created by Julien SANCHEZ on 09/04/10.
//  Copyright 2010 Gantis. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Image.h"


@interface WallPaperAppDelegate : NSObject {
	IBOutlet NSWindow *window;
    IBOutlet NSImageView *imageView;
	IBOutlet NSTableView *vueTableau;
	
	NSMutableArray * tableau;
}

- (void)selectionnerLigne:(id)sender;
- (void)ajouterImage:(id)location;
- (IBAction)ouvrirPanneau:(id)location;
- (void)openPanelDidEnd:(NSOpenPanel *)panel 
			 returnCode: (int)returnCode 
			contextInfo:(void *)contextInfo;

//TableView
- (int)numberOfRowsInTableView:(NSTableView *)tableView;
- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
			row:(int)row;

@end
