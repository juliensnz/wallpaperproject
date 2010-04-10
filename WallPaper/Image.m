//
//  image.m
//  WallPaper
//
//  Created by Julien SANCHEZ on 09/04/10.
//  Copyright 2010 Gantis. All rights reserved.
//

#import "Image.h"


@implementation Image

- (id)init {
	if (self = [super init]) {
		url = [[NSURL URLWithString:@"http://prout.com"] retain];//retainCount +1
		return self;
	}
	return nil;
}

- (void)dealloc {
	[url release];
	
	
	[super dealloc];
}

-(Image *)initWithUrl:(NSURL *)newUrl
{
	self = [self init];
	if (self != nil) {
		[url release];//retainCount = 0
		url = [newUrl retain];//retainCount = 1
		return self;
	}
	return nil;
}

-(NSString *)getString
{
	return [[NSString stringWithFormat:@"%@",url] lastPathComponent];
}

-(NSURL *)getUrl
{
	return url;
}

@end
