//
//  BFiTunesEntry.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFAtomEntry.h"

@class BFiTunesContentType, ONOXMLElement;

@interface BFiTunesReviewEntry : BFAtomEntry

@property (nonatomic, strong) BFiTunesContentType *contentType;
@property (nonatomic) NSInteger voteSum;
@property (nonatomic) NSInteger voteCount;
@property (nonatomic) NSInteger rating;
@property (nonatomic, strong) NSString *version;

@property (nonatomic, readonly) NSString *textContent; // convenience method

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end