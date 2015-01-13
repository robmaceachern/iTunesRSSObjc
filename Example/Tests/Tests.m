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
//
//describe(@"these will fail", ^{
//
//    it(@"can do maths", ^{
//        expect(1).to.equal(2);
//    });
//
//    it(@"can read", ^{
//        expect(@"number").to.equal(@"string");
//    });
//    
//    it(@"will wait and fail", ^AsyncBlock {
//        
//    });
//});

describe(@"these will pass", ^{
    
    it(@"can do maths", ^{
        expect(1).beLessThan(23);
    });
    
    it(@"can read", ^{
        expect(@"team").toNot.contain(@"I");
    });
    
    it(@"will wait and succeed", ^AsyncBlock {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            done();
        });
    });
    
    it(@"will do something cool", ^AsyncBlock {
        BFiTunesRss *itunesRSS = [[BFiTunesRss alloc] init];
        [itunesRSS customerReviewFeedForContentId:@"907242701" inCountry:@"us" pageNumber:10 completion:^(NSError *error, BFiTunesReviewFeed *reviewFeed) {
            if (error) {
                NSLog(@"%@", error.localizedDescription);
                return;
            }
            
            NSLog(@"Fetched %zd reviews", reviewFeed.reviewEntries.count);
            NSLog(@"Finished initial test");
            done();
        }];
    });
    
    it(@"will get all US reviews for 1989", ^AsyncBlock {
        BFiTunesRss *itunesRSS = [[BFiTunesRss alloc] init];
        [itunesRSS allCustomerReviewFeedsForContentId:@"907242701" inCountry:@"us" completion:^(NSError *error, NSArray *reviewFeeds) {
            if (error) {
                NSLog(@"Error: %@", error.localizedDescription);
            } else {
                //NSLog(@"%@", reviews);
                for (BFiTunesReviewFeed *reviewFeed in reviewFeeds) {
                    for (BFiTunesReviewEntry *reviewEntry in reviewFeed.reviewEntries) {
                        NSLog(@"Rating: %zd", reviewEntry.rating);
                        NSLog(@" - Content: %@", reviewEntry.textContent);
                        NSLog(@" - Updated: %@", reviewEntry.updated);
                        NSLog(@" - Author: %@", reviewEntry.author.name);
                    }
                }
                done();
            }
        }];
    });
    
    it(@"will get all canadian reviews for downcount", ^AsyncBlock {
        BFiTunesRss *itunesRSS = [[BFiTunesRss alloc] init];
        [itunesRSS allCustomerReviewFeedsForContentId:@"645771979" inCountry:@"ca" completion:^(NSError *error, NSArray *reviewFeeds) {
            if (error) {
                NSLog(@"Error: %@", error.localizedDescription);
            } else {
                //NSLog(@"%@", reviews);
                for (BFiTunesReviewFeed *reviewFeed in reviewFeeds) {
                    for (BFiTunesReviewEntry *reviewEntry in reviewFeed.reviewEntries) {
                        NSLog(@"Rating: %zd", reviewEntry.rating);
                        NSLog(@" - Content: %@", reviewEntry.textContent);
                        NSLog(@" - Updated: %@", reviewEntry.updated);
                        NSLog(@" - Author: %@", reviewEntry.author.name);
                    }
                }
                done();
            }
        }];
    });
});

SpecEnd
