//
//  image.m
//  WallPaper
//
//  Created by Julien SANCHEZ on 09/04/10.
//  Copyright 2010 Gantis. All rights reserved.
//

#import "Image.h"


@implementation Image

-(Image *)initWithUrl:(NSURL *)newUrl
{
	[self init];
	url = newUrl;
	return self;
}

-(NSString *)getString
{
	return [NSString stringWithFormat:@"%@",url];
}

-(NSURL *)getUrl
{
	return url;
}

@end
