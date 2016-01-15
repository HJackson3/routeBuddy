//
//  TableViewCell.h
//  Route Buddy
//
//  Created by Adam Lewis on 15/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmergencyContactTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end
