//
//  BFiTunesArtist.h
//  Pods
//
//  Created by Rob MacEachern on 2015-01-12.
//
//

#import <Foundation/Foundation.h>

@class ONOXMLElement;

@interface BFiTunesArtist : NSObject

@property (nonatomic, strong) NSString *href;
@property (nonatomic, strong) NSString *name;

- (id)initWithXMLElement:(ONOXMLElement *)element;

@end
