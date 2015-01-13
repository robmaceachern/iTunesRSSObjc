//
//  BFiTunesImage.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class ONOXMLElement;

@interface BFiTunesImage : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic) NSInteger height;

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
