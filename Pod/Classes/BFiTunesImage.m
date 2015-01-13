//
//  BFiTunesImage.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFiTunesImage.h"
#import "Ono.h"

@implementation BFiTunesImage

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self.height = [element[@"height"] integerValue];
        self.url = [element stringValue];
    }
    return self;
}

@end
