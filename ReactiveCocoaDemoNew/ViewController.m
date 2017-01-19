//
//  ViewController.m
//  ReactiveCocoaDemoNew
//
//  Created by 123456 on 17/1/6.
//  Copyright © 2017年 123456. All rights reserved.
//

#import "ViewController.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "CustomCell.h"


#ifdef DEBUG
static const int ddLogLevel = DDLogLevelVerbose;
#else
static const int ddLogLevel = DDLogLevelError;
#endif


@interface ViewController ()<ASTableDelegate, ASTableDataSource> {
    ASTableNode *tabNode;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //控制台打印信息的颜色设置
    setenv("XcodeColors", "YES", 0);
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    DDLogError(@"Paper jam");
    DDLogWarn(@"Toner is low");
    DDLogInfo(@"Warming up printer (pre-customization)");
    DDLogVerbose(@"Intializing protcol x26 (pre-customization)");

    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor] backgroundColor:[UIColor purpleColor] forFlag:DDLogFlagInfo];
    DDLogInfo(@"Warming up printer-------");
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 660 * 660 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    

    

    
    //优化tableview的创建
    tabNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    tabNode.view.frame = self.view.bounds;
    tabNode.delegate = self;
    tabNode.dataSource = self;
    [self.view addSubview:tabNode.view];
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ASTextCellNode *cell = [tableNode nodeForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ASTextCellNode alloc] init];
    }
    cell.text = [NSString stringWithFormat:@"第%ld行", (long)indexPath.row];

    return cell;
    
//    CustomCell *cell = [tableNode nodeForRowAtIndexPath:indexPath];
//    if (cell == nil) {
////        cell = [[CustomCell alloc] init];
//        cell = [[CustomCell alloc] init];
//    }
//    [cell createPage];
//    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end










































