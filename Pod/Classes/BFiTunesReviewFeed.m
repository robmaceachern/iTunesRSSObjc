//
//  BFiTunesFeed.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFiTunesReviewFeed.h"
#import "Ono.h"
#import "BFiTunesReviewEntry.h"
#import "BFiTunesMediaEntry.h"

@implementation BFiTunesReviewFeed

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super initWithXMLElement:element]) {
        NSMutableArray *reviewEntries = [NSMutableArray new];
        for (ONOXMLElement *entry in [element childrenWithTag:@"entry"]) {
            if ([entry childrenWithTag:@"rating" inNamespace:@"im"].count > 0) {
                [reviewEntries addObject:[[BFiTunesReviewEntry alloc] initWithXMLElement:entry]];
            } else if (self.mediaEntry == nil) {
                self.mediaEntry = [[BFiTunesMediaEntry alloc] initWithXMLElement:entry];
            }
        }
        self.reviewEntries = [NSArray arrayWithArray:reviewEntries];
    }
    return self;
}

@end
