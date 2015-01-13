//
//  BFiTunesArtist.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFiTunesArtist.h"
#import "Ono.h"

@implementation BFiTunesArtist

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self.href = element[@"href"];
        self.name = [element stringValue];
    }
    return self;
}

@end
