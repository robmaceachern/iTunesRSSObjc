//
//  BFAtomLink.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class ONOXMLElement;

@interface BFAtomLink : NSObject

@property (nonatomic, strong) NSString *rel;
@property (nonatomic, strong) NSString *href;
@property (nonatomic, strong) NSString *type;

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
