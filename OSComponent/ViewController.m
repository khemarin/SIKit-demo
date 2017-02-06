//
//  ViewController.m
//  OSComponent
//
//  Created by Khemarin on 1/30/17.
//  Copyright © 2017 Soteca. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<SIInputDelegate, SIInputDataSource, SIListControllerDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

/**
 Array of form elements formatted the same way as Dynamics
 */
@property (strong, nonatomic) NSArray *dynamicsForms;


/**
 Transformed form elements of dynamics to collectionview-compatible
 */
@property (strong, nonatomic) NSMutableArray *formItems;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.collectionView registerClass:[InputCell class] forCellWithReuseIdentifier:@"SIInputCell"];
    
    [self loadForm];
    [self.collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadForm {
    self.dynamicsForms = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testForm" ofType:@"plist"]];
    
    [self formatFormItems];
}

- (void) formatFormItems {
    self.formItems = [NSMutableArray array];
    NSUInteger columns = 0;
    
    for (NSDictionary *row in self.dynamicsForms) {
        if ([row valueForKey:@"groupName"]) {
            [self.formItems addObject:@{
                                        @"type" : @"group",
                                        @"title" : row[@"groupName"]
                                        }];
        }
        if ([row valueForKey:@"sectionName"]) {
            [self.formItems addObject:@{
                                        @"type" : @"section",
                                        @"title" : row[@"sectionName"],
                                        @"name" : row[@"sectionLogicalName"] ? : @""
                                        }];
        }
        
        NSArray *rowItems = row[@"sectionTab"];
        columns = [rowItems count];
        if ([row[@"fullwcell"] isEqualToString:@"YES"]) {
            [self.formItems addObject:rowItems[0]];
        }
        else {
            for (NSDictionary *item in rowItems) {
                NSMutableDictionary *formattedItem = [item mutableCopy];
                
                float colspan = [item[@"colspan"] isEqualToString:@""] ? 1.0 : [item[@"colspan"] floatValue];
                float widthMultiplier = colspan / columns;
                [formattedItem setObject:[NSNumber numberWithFloat:widthMultiplier] forKey:@"widthMultiplier"];
                
                [self.formItems addObject:formattedItem];
            }
        }
    }
}

#pragma mark - Input Delegate / DataSource
-(void)SIInputAccessoryButtonTouch:(SIInput *)input {
    NSString *title = [NSString stringWithFormat:@"%@", input.identifier];
    NSString *msg   = [NSString stringWithFormat:@"%@", input.inputValue];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(SIListController *)presentingViewControllerForInput:(SIInput *)input {
    NSBundle *sikitbundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"SIKit" ofType:@"bundle"]];
    SIListController *listController = [[SIListController alloc] initWithNibName:@"SIListController" bundle:sikitbundle];
    listController.delegate = self;
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < 10; i ++) {
        [items addObject:@{@"title": [NSString stringWithFormat:@"%@ %d",input.identifier, i + 1]}];
    }
    
    listController.list = items;
    listController.presenter = input;
    
    [listController refreshTableView];
    
    return listController;
}

#pragma mark - List Controller delegate
-(void)listController:(SIListController *)controller didSelectItem:(id)item {
    if (controller.presenter && [controller.presenter isKindOfClass:[SIInput class]]) {
        [((SIInput *)controller.presenter) updateInputValue:item[@"title"] andKey:nil];
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CollectionView datasource/delegate

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *formItem = self.formItems[indexPath.row];
    
    if ([formItem valueForKey:@"type"]) {
        GroupHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GroupHeaderCell" forIndexPath:indexPath];
        
        NSString *type  = formItem[@"type"];
        if ([type isEqualToString:@"group"]) {
            cell.backgroundColor = [UIColor colorWithRed:0.74 green:0.76 blue:0.78 alpha:1.0];
        }
        else {
            cell.backgroundColor = [UIColor colorWithRed:0.93 green:0.94 blue:0.95 alpha:1.0];;
        }
        
        cell.titleLabel.text = formItem[@"title"];
        
        return cell;
    }
    else{
        InputCell *cell = (InputCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"SIInputCell" forIndexPath:indexPath];
        
        cell.theme = [FormTheme globalTheme];
        cell.fieldInfo = formItem;
        cell.input.labelTitle = formItem[@"userLocLabel"];
        cell.padding = 5.0f;
        cell.input.delegate = self;
        cell.input.owningViewController = self;
        cell.input.dataSource = self;
        
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    NSDictionary *formItem = self.formItems[indexPath.row];
    float w = collectionView.bounds.size.width;
    
    if ([formItem valueForKey:@"type"]) {//It must be section or group
        return CGSizeMake(w, 30.0f);
    }
    
    float m = 1;
    if ([formItem valueForKey:@"widthMultiplier"]) {
        m = [formItem[@"widthMultiplier"] floatValue];
    }
    return CGSizeMake((w * m) - 10.0f, 51);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.formItems count];
}

@end
