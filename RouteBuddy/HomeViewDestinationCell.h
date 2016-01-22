//
//  HomeViewDestinationCell.h
//  RouteBuddy
//
//  Created by Adam Lewis on 22/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Destination.h"

@interface HomeViewDestinationCell : UITableViewCell

@property (weak, nonatomic) Destination *destination;

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;

- (IBAction)selectDestination:(id)sender;

@end
