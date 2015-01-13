//
//  BFiTunesMediaEntry.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFiTunesMediaEntry.h"
#import "Ono.h"
#import "BFiTunesContentType.h"
#import "BFiTunesArtist.h"
#import "BFiTunesPrice.h"
#import "BFiTunesImage.h"

@implementation BFiTunesMediaEntry

- (id)initWithXMLElement:(ONOXMLElement *)element {
    if (self = [super initWithXMLElement:element]) {
        self._imID = [element firstChildWithTag:@"id"][@"im:id"];
        self.bundleId = [element firstChildWithTag:@"id"][@"im:bundleId"];
        self.idURL = [[element firstChildWithTag:@"id"] stringValue];
        self.name = [[element firstChildWithTag:@"name" inNamespace:@"im"] stringValue];
        self.contentType = [[BFiTunesContentType alloc] initWithXMLElement:[element firstChildWithTag:@"contentType" inNamespace:@"im"]];
        self.artist = [[BFiTunesArtist alloc] initWithXMLElement:[element firstChildWithTag:@"artist" inNamespace:@"im"]];
        self.price = [[BFiTunesPrice alloc] initWithXMLElement:[element firstChildWithTag:@"price" inNamespace:@"im"]];
        NSMutableArray *images = [NSMutableArray new];
        for (ONOXMLElement *imageElement in [element childrenWithTag:@"image" inNamespace:@"im"]) {
            [images addObject:[[BFiTunesImage alloc] initWithXMLElement:imageElement]];
        }
        self.images = [NSArray arrayWithArray:images];
    }
    return self;
}

@end
