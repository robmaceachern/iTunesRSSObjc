//
//  iTunesRSSObjcTests.m
//  iTunesRSSObjcTests
//
//  Created by Rob MacEachern on 01/09/2015.
//  Copyright (c) 2014 Rob MacEachern. All rights reserved.
//

#import <BFiTunesRss.h>
#import <AFNetworking.h>
#import <AFOnoResponseSerializer.h>
#import <Ono.h>
#import <BFiTunesReviewFeed.h>
#import <BFiTunesReviewEntry.h>

SpecBegin(InitialSpecs)

describe(@"these should pass", ^{
    
    it(@"will get first page of US Facebook reviews", ^AsyncBlock {
        BFiTunesRss *itunesRSS = [[BFiTunesRss alloc] init];
        [itunesRSS customerReviewFeedForContentId:@"284882215" inCountry:@"us" pageNumber:1 completion:^(NSError *error, BFiTunesReviewFeed *reviewFeed) {
            if (error) {
                NSLog(@"%@", error.localizedDescription);
                return;
            }
            
            NSLog(@"Fetched %zd US Facebook reviews", reviewFeed.reviewEntries.count);
            done();
        }];
    });
});

SpecEnd
