//
//  BFiTunesContentType.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFiTunesContentType.h"
#import "Ono.h"

@implementation BFiTunesContentType

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self.term = element[@"term"];
        self.label = element[@"label"];
    }
    return self;
}

@end
