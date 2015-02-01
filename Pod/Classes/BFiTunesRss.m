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
#import "BFAppStoreTerritories.h"

@interface BFiTunesRss ()

@property (nonatomic, strong) AFHTTPSessionManager* sessionManager;

@end

@implementation BFiTunesRss

- (id)init {
    return [self initWithURLSessionConfiguration:nil];
}

- (id)initWithURLSessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    if (self = [super init]) {
        
        if (!configuration) {
            configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            configuration.URLCache = [[NSURLCache alloc] initWithMemoryCapacity:0 diskCapacity:50 * 1024 * 1024 diskPath:nil];
            configuration.timeoutIntervalForRequest = 1;
            configuration.timeoutIntervalForResource = 2;
        }
        
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
        
        // The iTunes RSS webservice seems to be doing some weird filtering based on UA.
        // Prepending Mozilla/5.0 seems to make it happy for some reason...
        NSString *oldUAString = [self.sessionManager.requestSerializer valueForHTTPHeaderField:@"User-Agent"];
        [self.sessionManager.requestSerializer setValue:[@"Mozilla/5.0 " stringByAppendingString:oldUAString] forHTTPHeaderField:@"User-Agent"];
        
        self.sessionManager.responseSerializer = [AFOnoResponseSerializer XMLResponseSerializer];
        NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:self.sessionManager.responseSerializer.acceptableContentTypes];
        [acceptableContentTypes addObject:@"application/atom+xml"];
        self.sessionManager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    }
    return self;
}

- (void)customerReviewFeedForContentId:(NSString *)contentId inCountry:(NSString *)countryCode pageNumber:(NSUInteger)pageNumber completion:(void (^)(NSError *error, BFiTunesReviewFeed *reviewFeed))completion {
    
    NSString *pathString = [NSString stringWithFormat:@"https://itunes.apple.com/%@/rss/customerreviews/id=%@/sortby=mostrecent/xml", [countryCode lowercaseString], contentId];
    if (pageNumber > 1) {
        pathString = [NSString stringWithFormat:@"https://itunes.apple.com/%@/rss/customerreviews/page=%zd/id=%@/sortby=mostrecent/xml?urlDesc=/customerreviews/page=%zd/id=%@/sortby=mostrecent/xml", [countryCode lowercaseString], pageNumber, contentId, pageNumber - 1, contentId];
    }
    [self.sessionManager GET:pathString
                  parameters:nil
                     success:^(NSURLSessionDataTask *task, ONOXMLDocument *responseObject) {
                         BFiTunesReviewFeed *reviewFeed = [[BFiTunesReviewFeed alloc] initWithXMLElement:responseObject.rootElement];

                         if (!reviewFeed.mediaEntry && reviewFeed.reviewEntries.count == 0) {
                             
                             NSDictionary *userInfo = @{
                                                        NSLocalizedDescriptionKey: NSLocalizedString(@"Unable to fetch review feed.", nil),
                                                        NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The iTunes RSS webservice is not operating properly.", nil),
                                                        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Please try again later.", nil)
                                                        };

                             NSError *error = [NSError errorWithDomain:@"com.robmaceachern.enero" code:90210 userInfo:userInfo];
                             completion(error, nil);
                         } else {
                             completion(nil, reviewFeed);
                         }
                     }
                     failure:^(NSURLSessionDataTask *task, NSError *error) {
                         completion(error, nil);
                     }];
}

@end
