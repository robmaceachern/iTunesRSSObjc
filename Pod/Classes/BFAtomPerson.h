//
//  BFAtomPerson.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class ONOXMLElement;

@interface BFAtomPerson : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *uri;

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
