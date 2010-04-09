//
//  image.h
//  WallPaper
//
//  Created by Julien SANCHEZ on 09/04/10.
//  Copyright 2010 Gantis. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Image : NSObject {
	NSURL * url;
}

-(Image *)initWithUrl:(NSURL *)newUrl;
-(NSString *)getString;
-(NSURL *)getUrl;
@end
