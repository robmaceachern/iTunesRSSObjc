//
//  BFiTunesPrice.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFiTunesPrice.h"
#import "Ono.h"

@implementation BFiTunesPrice

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self.amount = element[@"amount"];
        self.currency = element[@"currency"];
    }
    return self;
}

@end
