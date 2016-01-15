//
//  EmergencyContactFormViewController.h
//  Route Buddy
//
//  Created by Adam Lewis on 15/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EmergencyContactFormViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;

//- (IBAction)cancel:(id)sender;

- (IBAction)save:(id)sender;

@end
