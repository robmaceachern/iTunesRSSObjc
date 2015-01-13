//
//  BFiTunesFeed.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import "BFAtomFeed.h"

@class BFiTunesMediaEntry;

@interface BFiTunesReviewFeed : BFAtomFeed

@property (nonatomic, strong) BFiTunesMediaEntry *mediaEntry;
@property (nonatomic, strong) NSArray *reviewEntries; // NSArray of BFiTunesReviewEntry

@end
