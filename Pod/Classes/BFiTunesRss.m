//
//  BFiTunesRss.m
//  Pods
//
//  Created by Rob MacEachern on 2015-01-10.
//
//

#import "BFiTunesRss.h"
#import <AFOnoResponseSerializer.h>
#import <AFNetworking.h>
#import <Ono.h>
#import "BFiTunesReviewFeed.h"

@implementation BFiTunesRss

- (void)customerReviewFeedForContentId:(NSString *)contentId inCountry:(NSString *)countryCode pageNumber:(NSUInteger)pageNumber completion:(void (^)(NSError *error, BFiTunesReviewFeed *reviewFeed))completion {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFOnoResponseSerializer XMLResponseSerializer];
    NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
    [acceptableContentTypes addObject:@"application/atom+xml"];
    manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    
    NSString *pathString = [NSString stringWithFormat:@"https://itunes.apple.com/%@/rss/customerreviews/page=%zd/id=%@/sortby=mostrecent/xml?urlDesc=/customerreviews/page=%zd/id=%@/sortby=mostrecent/xml", countryCode, pageNumber, contentId, pageNumber - 1, contentId];
    
    [manager GET:pathString parameters:nil success:^(AFHTTPRequestOperation *operation, ONOXMLDocument *responseDocument) {
        BFiTunesReviewFeed *reviewFeed = [[BFiTunesReviewFeed alloc] initWithXMLElement:responseDocument.rootElement];
        completion(nil, reviewFeed);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(error, nil);
    }];
}

- (void)allCustomerReviewFeedsForContentId:(NSString *)contentId inCountry:(NSString *)countryCode completion:(void (^)(NSError *error, NSArray *reviewFeeds))completion {
    NSMutableArray *allReviews = [NSMutableArray array];
    __block NSError *catchError = nil;
    
    // Create a dispatch group
    dispatch_group_t group = dispatch_group_create();
    
    for (NSInteger i = 1; i < 11; i++) {
        dispatch_group_enter(group);
        
        [self customerReviewFeedForContentId:contentId inCountry:countryCode pageNumber:i completion:^(NSError *error, BFiTunesReviewFeed *reviewFeed) {
            if (error) {
                catchError = error;
            } else {
                [allReviews addObject:reviewFeed];
            }
            dispatch_group_leave(group);
        }];
    }
    
    // Here we wait for all the requests to finish
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        completion(catchError, allReviews);
    });
}

@end

@implementation BFiTunesRssReview


@end
