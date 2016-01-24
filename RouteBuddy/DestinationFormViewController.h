//
//  DestinationFormViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#import "Destination.h"
#import "LocationSelectViewController.h"

@interface DestinationFormViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) Destination *destination;

@property CLLocationCoordinate2D coordinate;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *updateButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;

-(void) dismissKeyboards;

-(IBAction)updateDestination:(id)sender;

-(IBAction)insertNewObject:(id)sender;

- (IBAction)takePhoto:(id)sender;
- (IBAction)selectFromGallery:(id)sender;

-(IBAction)back:(id)sender;

-(BOOL) isValidForm;

@end
