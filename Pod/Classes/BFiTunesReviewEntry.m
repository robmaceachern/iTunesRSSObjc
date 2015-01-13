//
//  BFiTunesEntry.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFiTunesReviewEntry.h"
#import "Ono.h"
#import "BFiTunesContentType.h"
#import "BFAtomContent.h"

@implementation BFiTunesReviewEntry

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super initWithXMLElement:element]) {
        self.contentType = [[BFiTunesContentType alloc] initWithXMLElement:[element firstChildWithTag:@"contentType" inNamespace:@"im"]];
        self.voteSum = [[[element firstChildWithTag:@"voteSum" inNamespace:@"im"] numberValue] integerValue];
        self.voteCount = [[[element firstChildWithTag:@"voteCount" inNamespace:@"im"] numberValue] integerValue];
        self.rating = [[[element firstChildWithTag:@"rating" inNamespace:@"im"] numberValue] integerValue];
        self.version = [[element firstChildWithTag:@"version" inNamespace:@"im"] stringValue];
    }
    return self;
}

- (NSString *)textContent {
    for (BFAtomContent *content in self.contents) {
        if ([content.type isEqualToString:@"text"]) {
            return content.content;
        }
    }
    return nil;
}

@end
