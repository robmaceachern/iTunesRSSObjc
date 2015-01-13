//
//  BFAtomEntry.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFAtomEntry.h"
#import "Ono.h"
#import "BFAtomContent.h"
#import "BFAtomLink.h"
#import "BFAtomPerson.h"

@implementation BFAtomEntry

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super init]) {
        self._id = [[element firstChildWithTag:@"id"] stringValue];
        self.updated = [[element firstChildWithTag:@"updated"] dateValue];
        self.title = [[element firstChildWithTag:@"title"] stringValue];
        
        NSMutableArray *contents = [NSMutableArray new];
        for (ONOXMLElement *content in [element childrenWithTag:@"content"]) {
            [contents addObject:[[BFAtomContent alloc] initWithXMLElement:content]];
        }
        self.contents = [NSArray arrayWithArray:contents];
        
        NSMutableArray *links = [NSMutableArray new];
        for (ONOXMLElement *link in [element childrenWithTag:@"link"]) {
            [links addObject:[[BFAtomLink alloc] initWithXMLElement:link]];
        }
        self.links = [NSArray arrayWithArray:links];
        
        self.author = [[BFAtomPerson alloc] initWithXMLElement:[element firstChildWithTag:@"author"]];
    }
    return self;
}

@end
