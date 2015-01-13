//
//  BFiTunesMediaEntry.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFAtomEntry.h"

@class BFiTunesArtist, BFiTunesPrice, BFiTunesImage, BFiTunesContentType, ONOXMLElement;

@interface BFiTunesMediaEntry : BFAtomEntry

@property (nonatomic, strong) NSString *_imID;
@property (nonatomic, strong) NSString *bundleId;
@property (nonatomic, strong) NSString *idURL;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) BFiTunesContentType *contentType;
@property (nonatomic, strong) BFiTunesArtist *artist;
@property (nonatomic, strong) BFiTunesPrice *price;
@property (nonatomic, strong) NSArray *images; // NSArray of BFiTunesImage

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
