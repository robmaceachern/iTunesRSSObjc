//
//  BFiTunesContentType.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class ONOXMLElement;

@interface BFiTunesContentType : NSObject

@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *term;

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
