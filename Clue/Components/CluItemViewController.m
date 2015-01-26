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

@interface CluItemViewController ()

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *children;

@end

@implementation CluItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupForItem];
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
    CluChildrenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.childrenNameLabel.text = [[[self.item.children allObjects] objectAtIndex:indexPath.row] name];
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

#pragma mark - private
-(void)setupForItem
{
    if(self.item.name!=nil && self.item.children.count == 0)
    {
        self.itemNameLabel.text = self.item.name;
    }else if (self.item.children.count > 0){
        self.itemNameLabel.text = @"(NL)Choisissez une notion";
    }else{
        self.itemNameLabel.text = @"(NL)Aucun choix";
    }
    
    [self.children reloadData];
}

#warning TODO KVO sur item plutôt que lancer setupforitem tout seul
#warning TODO selection seulement si feuille
#warning TODO navigation back
#warning TODO ajouter un breadcrum et une notion la phrase courante
#warning TODO reset de la phrase courant
#warning TODO reset de toute la base
#warning TODO bouton ajouter
#warning TODO cellule "peu importe" (ajouter dans json ?)


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
