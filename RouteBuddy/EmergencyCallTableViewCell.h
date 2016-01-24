//
//  EmergencyCallTableViewCell.h
//  RouteBuddy
//
//  Created by Adam Lewis on 24/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmergencyContact.h"

@interface EmergencyCallTableViewCell : UITableViewCell

@property (weak, nonatomic) EmergencyContact *emergencyContact;

@property (weak, nonatomic) IBOutlet UILabel *contactNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contactImage;

@end
