//
//  ViewController.m
//  FireBaseTesting
//
//  Created by vmoksha mobility on 1/23/17.
//  Copyright © 2017 vmoksha mobility. All rights reserved.
//

#import "ViewController.h"
#import <FirebaseDatabase/FirebaseDatabase.h>
#import <FirebaseStorage/FirebaseStorage.h>
#import <FirebaseDatabase/FirebaseDatabase.h>
#import <Firebase/Firebase.h>
@import Firebase;
#import "ModelData.h"
@interface ViewController ()
{
    //Creating objects for hold string value;
    NSString *employeeName;
    NSString *employeeDesignation;
    NSString *employeeID;
    ModelData *companyData;
    NSMutableArray *companyTableArray;
  
}
//Textfiled property
@property (weak, nonatomic) IBOutlet UITextField *employeeNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *employeeTextField;
@property (weak, nonatomic) IBOutlet UITextField *designationTextField;
- (IBAction)saveButtonClick:(UIButton *)sender;

//Creating FireDatabase reference property
@property FIRDatabaseReference *ref;
@property FIRDatabaseReference *ref2;
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    companyTableArray=[[NSMutableArray alloc]init];
    
    [self companyLocalData];
    //    [[self.ref child:@"EmployeeName"] setValue:employeeName];
    //    [[self.ref child:@"EmployeeID"] setValue:employeeID];
    //    [[self.ref child:@"Designation"] setValue:employeeDesignation];
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

//Save data button action
- (IBAction)saveButtonClick:(UIButton *)sender
{
    
    employeeName=_employeeNameTextField.text;
    employeeID=_employeeTextField.text;
    employeeDesignation=_designationTextField.text;
    
    //Firebase database reference for saving data
    self.ref = [[FIRDatabase database] reference];
    
    //Dictionary key value data for Saving data in Firebase
    NSDictionary *dictData = @{@"EmployeeName" :employeeName,
                                @"EmployeeID" :employeeID,
                                @"Designation" :employeeDesignation
                                };
    
    _ref = [_ref childByAutoId];
     [_ref setValue: dictData];

}

//Company Local Data Storage
-(void)companyLocalData
{
    
    
//    
//    FIRDatabaseReference * ref = [[FIRDatabase alloc] referenceFromURL:@"https://testingfirebaseapp-445b2.firebaseio.com/"];
//    //NSLog(@"%@",ref);
//    
//       FIRDatabaseQuery *recentPostsQuery = [[self.ref child:@"posts"] queryOrderedByKey];
//    
//    for(NSDictionary *dict in ref)
//    {
//        companyData=[[ModelData alloc]init];
//        companyData.name=dict[@"EmployeeName"];
//        companyData.empId=dict[@"EmployeeID"];
//        companyData.designation=dict[@"Designation"];
//        [companyTableArray addObject:companyData];
 
  //  }
    
    
    

    
}

@end
