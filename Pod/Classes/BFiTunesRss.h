//
//  BFiTunesRss.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-10.
//
//

#import <Foundation/Foundation.h>
#import "BFiTunesReviewFeed.h"
#import "BFiTunesArtist.h"
#import "BFiTunesContentType.h"
#import "BFiTunesImage.h"
#import "BFiTunesMediaEntry.h"
#import "BFiTunesPrice.h"
#import "BFiTunesReviewEntry.h"
#import "BFAtomPerson.h"

@class BFiTunesReviewFeed;

@interface BFiTunesRss : NSObject

- (void)customerReviewFeedForContentId:(NSString *)contentId inCountry:(NSString *)countryCode pageNumber:(NSUInteger)pageNumber completion:(void (^)(NSError *error, BFiTunesReviewFeed *reviewFeed))completion;

- (void)allCustomerReviewFeedsForContentId:(NSString *)contentId inCountry:(NSString *)countryCode completion:(void (^)(NSError *error, NSArray *reviewFeeds))completion;

@end

@interface BFiTunesRssReview : NSObject


@end
