//
//  CluItemViewController.m
//  Clue
//
//  Created by Jean-Baptiste Rieu on 25/01/2015.
//  Copyright (c) 2015 jbrieu. All rights reserved.
//

#import "CluItemViewController.h"
#import "CluItem.h"
#import "CluChildrenCollectionViewCell.h"
#import "CluItem+DataAccess.h"

@interface CluItemViewController () <CluChildrenCollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *children;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationTitle;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation CluItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupForItem];
    
    [self.backButton setTitle:@"retour" forState:UIControlStateNormal];
    [self.addButton setTitle:@"ajouter" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View (Children)
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.item.children.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CluItem *item = [[self.item.children allObjects] objectAtIndex:indexPath.row];
    CluChildrenCollectionViewCell *cell;
    if([item.children count]>0){
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    }else{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"leafCell" forIndexPath:indexPath];
    }
    
    cell.delegate = self;
    [cell setupWithItem:item];
    
    return cell;
}



-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CluItem *selectedItem = [[self.item.children allObjects] objectAtIndex:indexPath.row];
    return [selectedItem.children count]>0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CluItem *selectedItem = [[self.item.children allObjects] objectAtIndex:indexPath.row];
    if([selectedItem.children count]>0)
    {
        self.item = selectedItem;
        [self setupForItem];
    }
}

#pragma mark - buttons

- (IBAction)backButtonPressed:(id)sender {
    self.item = self.item.parent;
    [self setupForItem];
}

- (IBAction)addButtonPressed:(id)sender {
    [self.item addBlankChildInMOC:self.item.managedObjectContext];
    [self setupForItem];
}

#pragma mark - private
-(void)setupForItem
{
    if(self.item.name!=nil)
    {
        self.navigationTitle.title = self.item.name;
    }else if (self.item.children.count > 0){
        self.navigationTitle.title = @"(NL)Choisissez une notion";
    }else{
        self.navigationTitle.title = @"(NL)Aucun choix";
    }
    
    [self.children reloadData];
    
    self.backButton.hidden = (self.item.parent==nil);
    self.addButton.hidden = ([self.item numberOfChildrenWithNoName]>0);
}

-(void)CluChildrenCollectionViewCellDidChangeName:(NSString *)newName forItem:(CluItem *)item
{
    [item renameWord:newName inMOC:item.managedObjectContext];
    
    [self setupForItem];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
