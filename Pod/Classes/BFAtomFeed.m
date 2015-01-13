//
//  BFRSSFeed.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFAtomFeed.h"
#import "Ono.h"
#import "BFAtomLink.h"
#import "BFAtomPerson.h"
#import "BFAtomEntry.h"

@implementation BFAtomFeed

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self._id = [[element firstChildWithTag:@"id"] stringValue];
        self.title = [[element firstChildWithTag:@"title"] stringValue];
        self.updated = [[element firstChildWithTag:@"updated"] dateValue];
        
        NSMutableArray *links = [NSMutableArray new];
        for (ONOXMLElement *link in [element childrenWithTag:@"link"]) {
            [links addObject:[[BFAtomLink alloc] initWithXMLElement:link]];
        }
        self.links = [NSArray arrayWithArray:links];
        
        self.icon = [[element firstChildWithTag:@"icon"] stringValue];
        self.author = [[BFAtomPerson alloc] initWithXMLElement:[element firstChildWithTag:@"author"]];
        self.rights = [[element firstChildWithTag:@"rights"] stringValue];
        
        NSMutableArray *entries = [NSMutableArray new];
        for (ONOXMLElement *entry in [element childrenWithTag:@"entry"]) {
            [entries addObject:[[BFAtomEntry alloc] initWithXMLElement:entry]];
        }
    }
    return self;
}

@end
