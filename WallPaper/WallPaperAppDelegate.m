//
//  WallPaperAppDelegate.m
//
//  Created by Julien SANCHEZ on 09/04/10.
//  Copyright 2010 Gantis. All rights reserved.
//

#import "WallPaperAppDelegate.h"

@implementation WallPaperAppDelegate

-(void)awakeFromNib
{
	tableau = [[NSMutableArray alloc] init];
	NSLog(@"%@",tableau);
}

- (IBAction)ouvrirPanneau:(id)sender {
    NSLog(@"Ouverture du panneau");
	NSOpenPanel * panneauDeSelection = [NSOpenPanel openPanel];
	NSString * extensions = @"jpg/jpeg/JPG/JPEG/png/PNG";
	NSArray * types = [extensions pathComponents];
	
	[panneauDeSelection beginSheetForDirectory: NULL 
										  file: NULL 
										 types: types
								modalForWindow: window 
								 modalDelegate: self
								didEndSelector: @selector(openPanelDidEnd:returnCode:contextInfo:
														  )
								   contextInfo:NULL];
}

- (void)openPanelDidEnd:(NSOpenPanel *)panel 
			 returnCode: (int)returnCode 
			contextInfo:(void *)contextInfo
{
	if(returnCode == NSOKButton)
	{
		//Si l'utilisateur a cliqué sur Ok
		[self ajouterImage: [[panel URLs] objectAtIndex:0]];
	}
	else {
		NSLog(@"Opération annulée par l'utilisateur");
	}

}

- (void)ajouterImage:(NSURL *)location
{
	NSLog(@"Chargement de la photo  : %@",location);
	Image * newImage = [[Image alloc] initWithUrl:location];
	NSLog(@"valeur de l'image : %@",[newImage getUrl]);
	[tableau addObject:newImage];
	[vueTableau reloadData];
	NSLog(@"Actualisation du tableau : %@",tableau);
	[imageView setImage:[[NSImage alloc] initWithContentsOfURL:location]];
}

-(void)selectionnerLigne:(id)sender
{
	NSLog(@"Ligne Sélectionnée");
	NSURL * url = [[tableau objectAtIndex:[vueTableau selectedRow]] getUrl];
	NSLog(@"Url : %@",url);
	[imageView setImage:[[NSImage alloc] initWithContentsOfURL:url]];
}

- (int)numberOfRowsInTableView:(NSTableView *)tableView
{
	return [tableau count];
}

- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
			row:(int)row
{
	NSLog(@"Mise à jour %@",[[tableau objectAtIndex:row] getUrl]);
	return [[tableau objectAtIndex:row] getUrl];
}
@end
