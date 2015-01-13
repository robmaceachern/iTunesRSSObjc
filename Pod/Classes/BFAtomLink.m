//
//  BFAtomLink.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFAtomLink.h"
#import "Ono.h"

@implementation BFAtomLink

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self.rel = element[@"rel"];
        self.href = element[@"href"];
        self.type = element[@"type"];
    }
    return self;
}

@end
