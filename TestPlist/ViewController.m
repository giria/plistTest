//
//  ViewController.m
//  TestPlist
//
//  Created by Joan Barrull Ribalta on 17/03/15.
//  Copyright (c) 2015 com.giria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)readPlist:(UIButton *)sender {
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"Mercadona" ofType:@"plist"];
    NSDictionary * contentDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSLog(@" Dictionary %@",contentDictionary);
    
    
    NSArray *listaCompra =contentDictionary[@"items"];
    
    NSLog(@" Arrays %@",listaCompra);

    
    
    
    
    
    
}



- (IBAction)saveToPlist:(UIButton *)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Mercadona33.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@" directorio %@", path);
    
//    if (![fileManager fileExistsAtPath: path])
//    {
//        path = [documentsDirectory stringByAppendingPathComponent: [NSString stringWithFormat: @"Mercadona33.plist"] ];
//    }

    NSMutableDictionary *data;
    
    if ([fileManager fileExistsAtPath: path])
    {
        data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    }
    else
    {
        // If the file doesn’t exist, create an empty dictionary
        data = [[NSMutableDictionary alloc] init];
    }
    
    //To insert the data into the plist
    int value = 5;
    [data setObject:[NSNumber numberWithInt:value] forKey:@"value"];
    [data writeToFile: path atomically:YES];
    
    
    
    
    
    
    
    
    
    
 }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
