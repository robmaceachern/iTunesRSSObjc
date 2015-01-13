//
//  BFiTunesPrice.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class ONOXMLElement;

@interface BFiTunesPrice : NSObject

@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *currency;

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
