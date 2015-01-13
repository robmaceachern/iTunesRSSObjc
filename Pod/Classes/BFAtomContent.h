//
//  BFAtomContent.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class ONOXMLElement;

@interface BFAtomContent : NSObject

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *content;

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
