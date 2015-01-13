//
//  BFRSSFeed.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class BFAtomPerson, BFAtomLink, ONOXMLElement;

@interface BFAtomFeed : NSObject

@property (nonatomic, strong) NSString *_id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *updated;
@property (nonatomic, strong) NSArray *links; // NSArray of BFAtomLink
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) BFAtomPerson *author;
@property (nonatomic, strong) NSString *rights;
@property (nonatomic, strong) NSArray *entries; // NSArray of BFAtomEntry

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
