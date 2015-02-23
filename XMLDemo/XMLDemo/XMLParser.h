//
//  XMLParser.h
//  XMLDemo
//
//  Created by Vinita Miranda on 2/19/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XMLParser;

@protocol XMLParserDelegate
-(void)XMLParser:(XMLParser *)amlParser didParserDataWithOutput:(NSArray *)outputArray;

@end
@interface XMLParser : NSObject <NSXMLParserDelegate>
@property(nonatomic)NSMutableString *currentElementValue;
@property(nonatomic)NSMutableArray *arrayOfObjects;
@property(nonatomic)NSString *currentElement;
@property(assign)id <XMLParserDelegate>delegate;
- (XMLParser *) initXMLParserWithDelegate:(id)delegate ;
@end
