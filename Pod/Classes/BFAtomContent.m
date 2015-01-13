//
//  BFAtomContent.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFAtomContent.h"
#import "Ono.h"

@implementation BFAtomContent

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self.type = element[@"type"];
        self.content = [element stringValue];
    }
    return self;
}

@end
