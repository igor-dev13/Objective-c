
//  MainTableViewController.m
//  Currency
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "MainTableViewController.h"
#import "DetailViewController.h"
#import "MyTableVIewCell.h"

static NSString * const currencyUrl = @"http://www.nbrb.by/Services/XmlMetalsRef.aspx";

@interface MainTableViewController ()

@property (nonnull, nonatomic, strong) NSMutableArray * arrayEvents;
@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, strong) NSMutableArray *arrCurrencyData;
@property (nonatomic, strong) NSMutableDictionary *dictTempDataStorage;
@property (nonatomic, strong) NSMutableString *foundValue;
@property (nonatomic, strong) NSString *currentElement;

-(void)downloadCurrency;

@end

@implementation MainTableViewController

- (NSString *)setPageValue: (DetailViewController *) sender;{
    return self.currentText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MyTableViewCell class])];
    [self downloadCurrency];
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrCurrencyData.count;
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyTableViewCell class]) forIndexPath:indexPath];
    cell.currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,cell.frame.size.width,cell.frame.size.height)];
    cell.currencyLabel.textAlignment = NSTextAlignmentCenter;
    cell.currencyLabel.text = [[self.arrCurrencyData objectAtIndex:indexPath.row] objectForKey:@"Name"];
    [cell.contentView addSubview:cell.currencyLabel];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController * detailView = [[DetailViewController alloc] init];
    detailView.delegate = self;
    [self.navigationController pushViewController:detailView animated:YES];
    self.currentText = [[self.arrCurrencyData objectAtIndex:indexPath.row] objectForKey:@"Name"];
}

-(void)downloadCurrency {
    NSString *URLString = [NSString stringWithFormat:currencyUrl];
    
    NSURL *url = [NSURL URLWithString:URLString];
    // Download the data.
    [AppDelegate downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
        // Make sure that there is data.
        if (data != nil) {
            self.xmlParser = [[NSXMLParser alloc] initWithData:data];
            self.xmlParser.delegate = self;
            
            // Initialize the mutable string that we'll use during parsing.
            self.foundValue = [[NSMutableString alloc] init];
            
            // Start parsing.
            [self.xmlParser parse];
        }
    }];
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    // Initialize the currency data array.
    self.arrCurrencyData = [[NSMutableArray alloc] init];
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    // When the parsing has been finished then simply reload the table view.
    [self.tableView reloadData];
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@", [parseError localizedDescription]);
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    // If the current element name is equal to "Metals" then initialize the temporary dictionary.
    if ([elementName isEqualToString:@"Metals"]) {
        self.dictTempDataStorage = [[NSMutableDictionary alloc] init];
    }
    // Keep the current element.
    
    self.currentElement = elementName;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"Metal"]) {
        // If the closing element equals to "Metal" then the all the data of a neighbour country has been parsed and the dictionary should be added to the neighbours data array.
        [self.arrCurrencyData addObject:[[NSDictionary alloc] initWithDictionary:self.dictTempDataStorage]];
    }
    else if ([elementName isEqualToString:@"Name"]){
        // If the country name element was found then store it.
        [self.dictTempDataStorage setObject:[NSString stringWithString:self.foundValue] forKey:@"Name"];
    }
    else if ([elementName isEqualToString:@"NameEng"]){
        // If the toponym name element was found then store it.
        [self.dictTempDataStorage setObject:[NSString stringWithString:self.foundValue] forKey:@"NameEng"];
    }
    
    // Clear the mutable string.
    [self.foundValue setString:@""];
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    // Store the found characters if only we're interested in the current element.
    if ([self.currentElement isEqualToString:@"Name"] ||
        [self.currentElement isEqualToString:@"NameEng"]) {
        
        if (![string isEqualToString:@"\n"]) {
            [self.foundValue appendString:string];
        }
    }
}

@end
