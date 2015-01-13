//
//  BFAtomEntry.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class BFAtomContent, BFAtomPerson, ONOXMLElement;

@interface BFAtomEntry : NSObject

@property (nonatomic, strong) NSString *_id;
@property (nonatomic, strong) NSDate *updated;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *contents; // NSArray of BFAtomContent
@property (nonatomic, strong) NSArray *links; // NSArray of BFAtomLink
@property (nonatomic, strong) BFAtomPerson *author;

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
