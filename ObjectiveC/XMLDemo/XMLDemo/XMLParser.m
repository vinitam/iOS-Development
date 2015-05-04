//
//  XMLParser.m
//  XMLDemo
//
//  Created by Vinita Miranda on 2/19/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "XMLParser.h"
#import "Drinks.h"
#import "DrinkCategory.h"
#import "AppDelegate.h"
@interface XMLParser ()
@property(nonatomic)Drinks *drinks;
@property(nonatomic)NSXMLParser *parser;
@end

@implementation XMLParser

- (XMLParser *) initXMLParserWithDelegate:(id)delegate {
    // init array of user objects
    
    self.parser = [[NSXMLParser alloc]
              initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                            pathForResource:@"drinks" ofType: @"xml"]]];
    [self.parser setDelegate:self];
    self.delegate= delegate;
    [self.parser parse];
    
    return self;
}


- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.arrayOfObjects = [[NSMutableArray alloc] init];

}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    self.currentElement = elementName;
    
    if ([self.currentElement isEqualToString:@"element"])
    {
        self.drinks = [NSEntityDescription insertNewObjectForEntityForName:@"Drinks" inManagedObjectContext:appDelegate.managedObjectContext];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    
    if ([self.currentElement isEqualToString:@"category"])
    {
        self.drinks.drink_category = [NSEntityDescription insertNewObjectForEntityForName:@"DrinkCategory" inManagedObjectContext:appDelegate.managedObjectContext];
        self.drinks.drink_category.name = string;
    }
    else if ([self.currentElement isEqualToString:@"ingredients"])
    {
        self.drinks.ingredients = string;
    }
    else if ([self.currentElement isEqualToString:@"instructions"])
    {
        self.drinks.instructions = string;
    }
    else if ([self.currentElement isEqualToString:@"name"])
    {
        self.drinks.name = string;
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {

    
    if ([elementName isEqualToString:@"element"])
    {
        [self.arrayOfObjects addObject:self.drinks];

    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSDictionary *userInfo = parseError.userInfo;
    NSNumber *lineNumber   = userInfo[@"NSXMLParserErrorLineNumber"];
    NSNumber *errorColumn  = userInfo[@"NSXMLParserErrorColumn"];
    NSString *errorMessage = userInfo[@"NSXMLParserErrorMessage"];
    
    NSLog(@"Error occured in line %@ and column %@\nWith message: %@", lineNumber, errorColumn, errorMessage);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self.delegate XMLParser:self didParserDataWithOutput:self.arrayOfObjects];
}

@end
