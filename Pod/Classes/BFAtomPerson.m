//
//  BFAtomPerson.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFAtomPerson.h"
#import "Ono.h"

@implementation BFAtomPerson

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self.name = [[element firstChildWithTag:@"name"] stringValue];
        self.uri = [[element firstChildWithTag:@"uri"] stringValue];
    }
    return self;
}

@end
