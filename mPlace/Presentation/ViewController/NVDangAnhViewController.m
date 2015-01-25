//
//  NVDangAnhViewController.m
//  mPlace
//
//  Created by hoanhnv on 16/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVDangAnhViewController.h"
#import "Base64.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "NVGetAnhCanhBaoService.h"

#define KEYBOARD_ANIMATION_DURATION     0.3f
#define MINIMUM_SCROLL_FRACTION         0.2f
#define MAXIMUM_SCROLL_FRACTION         0.8f
#define PORTRAIT_KEYBOARD_HEIGHT        216

@interface NVDangAnhViewController ()

@end

@implementation NVDangAnhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect rectMain = [UIScreen mainScreen].bounds;
    CGRect rDetail = self.vDetaiView.frame;
    rDetail.origin.y = CGRectGetMaxY(self.vMiddle.frame);
    self.vDetaiView.frame = rDetail;
    [self.vMainScrollView addSubview:self.vDetaiView];
    [self.vMainScrollView setContentSize:CGSizeMake(rectMain.size.width,
                                                    CGRectGetMaxY(self.vDetaiView.frame)+100)];
    self.btnClose1.hidden = YES;
    self.btnClose2.hidden = YES;
    self.btnClose3.hidden = YES;
    self.btnClose4.hidden = YES;
    numberImage = 0;
     selectedDate = [NSDate new];
     CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    self.myDatePicker = [[NVDatePicker alloc] initWithFrame:CGRectMake(0, screenHeight/2 - 35, screenWidth, screenHeight/2 + 35)];
    [self.myDatePicker addTargetForDoneButton:self action:@selector(donePressed)];
    [self.view addSubview:    self.myDatePicker];
     [self.myDatePicker setHidden:YES];
    [self.myDatePicker setMode:UIDatePickerModeDate];
    [self.myDatePicker.picker addTarget:self action:@selector(pickerChanged) forControlEvents:UIControlEventValueChanged];
    [self.myDatePicker setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - text filed delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.txtLocation resignFirstResponder];
    [self.txtWarning resignFirstResponder];
    [self.txtLocation resignFirstResponder];
    [self.txtTitle resignFirstResponder];
    [self.txtPhone resignFirstResponder];
    //[self doDangTin:nil];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    /*UIInterfaceOrientation orientation =
     [[UIApplication sharedApplication] statusBarOrientation];
     if (orientation == UIInterfaceOrientationPortrait ||
     orientation == UIInterfaceOrientationPortraitUpsideDown)
     {*/
    self.animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    /*}
     else
     {
     animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
     }*/
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= self.animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += self.animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)btnTime_Click:(id)sender {
    self.myDatePicker.hidden = NO;
    [self textFieldShouldReturn:nil];
        
}
-(void)pickerChanged {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
     selectedDate = self.myDatePicker.picker.date;
    [self.lbTime setText:[dateFormatter stringFromDate:selectedDate]];
}

-(void)donePressed {
     self.myDatePicker.hidden = YES;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy";

    [self.lbTime setText:[dateFormatter stringFromDate:selectedDate]];
}
- (IBAction)showLeftMenu:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doSearch:(id)sender {
    
}

- (IBAction)doClose_Image:(id)sender {
    UIButton *btn = (UIButton*)sender;
    if (btn == self.btnClose1) {
        self.btnClose1.hidden = YES;
        [self.btnImage1 setTitle:@"+" forState:UIControlStateNormal];
        [self.btnImage1 setBackgroundImage:nil forState:UIControlStateNormal];
    }
    if (btn == self.btnClose2) {
        self.btnClose2.hidden = YES;
        [self.btnImage2 setTitle:@"+" forState:UIControlStateNormal];
        [self.btnImage2 setBackgroundImage:nil forState:UIControlStateNormal];
    }
    if (btn == self.btnClose3) {
        self.btnClose3.hidden = YES;
        [self.btnImage3 setTitle:@"+" forState:UIControlStateNormal];
        [self.btnImage3 setBackgroundImage:nil forState:UIControlStateNormal];
    }
    if (btn == self.btnClose4) {
        self.btnClose4.hidden = YES;
        [self.btnImage4 setTitle:@"+" forState:UIControlStateNormal];
        [self.btnImage4 setBackgroundImage:nil forState:UIControlStateNormal];
    }
    self.image1 = self.image2= self.image3 = self.image4 = nil;
}

- (IBAction)doAddImage:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Chọn ảnh từ..." delegate:self cancelButtonTitle:@"Ẩn" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Thư viện ảnh", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    actionSheet.alpha=0.90;
    actionSheet.tag = 1;
    [actionSheet showFromTabBar:self.tabBarController.tabBar];
    UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 100:
                self.fromImage = 1;
            break;
        case 101:
                self.fromImage = 2;
            break;
        case 102:
                self.fromImage = 3;
            break;
        case 103:
                self.fromImage = 4;
            break;
            
        default:
            break;
    }

    [self textFieldShouldReturn:nil];
    self.myDatePicker.hidden = YES;
}
- (IBAction)doDangTin:(id)sender {
    NSString *message = nil;
    if (numberImage ==0) {
        message = @"Bạn chưa chọn ảnh";
    }
    else if ([self trimStringSpaceWhite:self.txtTitle.text].length == 0) {
        message = @"Bạn chưa nhập tiêu đề ảnh";
        [self.txtTitle resignFirstResponder];
    } else if ([self trimStringSpaceWhite:self.txtWarning.text].length == 0) {
        message = @"Bạn chưa nhập thông tin cảnh báo";
        [self.txtWarning resignFirstResponder];
    } else if ([self trimStringSpaceWhite:self.txtLocation.text].length == 0) {
        message = @"Bạn chưa nhập địa điểm";
        [self.txtLocation resignFirstResponder];
    } else if ([self.lbTime.text isEqualToString:@"dd/mm/yyyy"]) {
        message = @"Bạn chưa nhập thời gian";
    }
    if (message){
        UIAlertView *alleart = [[UIAlertView alloc] initWithTitle:@"Thông báo" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alleart.delegate = self;
        [alleart show];
        return;
    }
    NSMutableDictionary *parameters = [self generateParameter];
    [NVGetAnhCanhBaoService uploadAnhCanhBao:parameters andComple:^(id dataResponse){
        int code = [[dataResponse objectForKey:@"code"]integerValue];
        if (code == 0) {
            [self resetForm];
            UIAlertView *alleart = [[UIAlertView alloc] initWithTitle:@"Thông báo" message:[dataResponse valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            alleart.delegate = self;
            [alleart show];
            
            return;
        }
    }
    andFailure:^(NSError*err){
    }];
}
-(void)resetForm{
    self.txtPhone.text =STRING_EMPTY;
    self.txtPhone.text = STRING_EMPTY;
    self.txtTitle.text = STRING_EMPTY;
    self.txtWarning.text = STRING_EMPTY;
    self.lbTime.text =@"dd/mm/yyyy";
    [self doClose_Image:self.btnClose1];
     [self doClose_Image:self.btnClose2];
     [self doClose_Image:self.btnClose3];
     [self doClose_Image:self.btnClose4];
}
- (NSString*) trimStringSpaceWhite:(NSString*) input {
    input = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return input;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (actionSheet.tag)
    {
        case 1:
            switch (buttonIndex)
        {
            case 0:
            {
                if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
                {
                    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
                    controller.allowsEditing = NO;
                    controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
                    controller.delegate = self;
                    [self.navigationController presentViewController: controller animated: YES completion: nil];
                }
                break;
            }
            case 1:
            {
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.allowsEditing = YES;
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                picker.delegate = self;
                [self presentViewController:picker animated:YES completion:^{}];
            }
                break;
        }
            break;
            
        default:
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    switch (self.fromImage) {
        case 1:{
            self.image1 = [info valueForKey:UIImagePickerControllerOriginalImage];
            if(NULL == self.image1){
                [self loadImageFromAssertByUrl:[info objectForKey:@"UIImagePickerControllerReferenceURL"]
                                                       completion:^(UIImage * selectedImage){
                                                           //img not null here
                                                           NSLog(@"img2 ::: %@", selectedImage);
                                                           self.image1 = self.image1;
                                                           [self.btnImage1 setBackgroundImage:self.image1 forState:UIControlStateNormal];
                                                           self.btnClose1.hidden = NO;
                                                           [self.btnImage1 setTitle:@"" forState:UIControlStateNormal];
                                                       }];

            }
            else{
                [self.btnImage1 setBackgroundImage:self.image1 forState:UIControlStateNormal];
                self.btnClose1.hidden = NO;
                [self.btnImage1 setTitle:@"" forState:UIControlStateNormal];
            }
        }
            break;
        case 2:{
             self.image2 = [info valueForKey:UIImagePickerControllerOriginalImage];
            if(NULL == self.image2){
                [self loadImageFromAssertByUrl:[info objectForKey:@"UIImagePickerControllerReferenceURL"]
                                                                              completion:^(UIImage * selectedImage){
                                                                                  //img not null here
                                                                                  NSLog(@"img2 ::: %@", selectedImage);
                                                                                  self.image2 = self.image2;
                                                                                [self.btnImage2 setBackgroundImage:self.image2 forState:UIControlStateNormal];
                                                                                  self.btnClose2.hidden = NO;
                                                                                  [self.btnImage2 setTitle:@"" forState:UIControlStateNormal];
                                                                              }];
            }
            else{
                [self.btnImage2 setBackgroundImage:self.image2 forState:UIControlStateNormal];
                self.btnClose2.hidden = NO;
                [self.btnImage2 setTitle:@"" forState:UIControlStateNormal];
            }
        }
            break;
            
        case 3:{
            self.image3 = [info valueForKey:UIImagePickerControllerOriginalImage];
            if (self.image3 == NULL) {
                [self loadImageFromAssertByUrl:[info objectForKey:@"UIImagePickerControllerReferenceURL"]
                                                       completion:^(UIImage * selectedImage){
                                                           //img not null here
                                                           NSLog(@"img2 ::: %@", selectedImage);
                                                           self.image3 = self.image3;
                                                           [self.btnImage3 setBackgroundImage:self.image3 forState:UIControlStateNormal];
                                                           self.btnClose3.hidden = NO;
                                                           [self.btnImage3 setTitle:@"" forState:UIControlStateNormal];
                                                       }];
            }
            else{
                 [self.btnImage3 setBackgroundImage:self.image3 forState:UIControlStateNormal];
                self.btnClose3.hidden = NO;
                [self.btnImage3 setTitle:@"" forState:UIControlStateNormal];
            }
        }
            break;
            
        case 4:{
            self.image4 = [info valueForKey:UIImagePickerControllerOriginalImage];
            if (self.image4 == NULL) {
                [self loadImageFromAssertByUrl:[info objectForKey:@"UIImagePickerControllerReferenceURL"]
                                                       completion:^(UIImage * selectedImage){
                                                           //img not null here
                                                           NSLog(@"img2 ::: %@", selectedImage);
                                                           self.image4 = self.image4;
                                                           [self.btnImage4 setBackgroundImage:self.image4 forState:UIControlStateNormal];
                                                           self.btnClose4.hidden = NO;
                                                           [self.btnImage4 setTitle:@"" forState:UIControlStateNormal];
                                                       }];
            }
            else{
                [self.btnImage4 setBackgroundImage:self.image4 forState:UIControlStateNormal];
                self.btnClose4.hidden = NO;
                [self.btnImage4 setTitle:@"" forState:UIControlStateNormal];
            }

        }
            break;
            
        default:
            break;
    }
}
-(UIImage*)loadImageFromAssertByUrl:(NSURL*)url completion:(void (^)(UIImage*)) completion{
    
    __block UIImage* img;
    ALAssetsLibrary *assetLibrary=[[ALAssetsLibrary alloc] init];
    
    [assetLibrary assetForURL:url resultBlock:^(ALAsset *asset) {
        ALAssetRepresentation *rep = [asset defaultRepresentation];
        Byte *buffer = (Byte*)malloc(rep.size);
        NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:rep.size error:nil];
        NSData *data = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];
        img = [UIImage imageWithData:data];
        completion(img);
        NSLog(@"img ::: %@", img);
    } failureBlock:^(NSError *err) {
        NSLog(@"Error: %@",[err localizedDescription]);
    }];
    
    return img;
}
-(NSString*)imageToBase64String:(UIImage*)image{
    //image = [UIImage imageNamed:@"ic_100_places.png"];
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSString *imageDataEncodedString = [imageData base64EncodedString];
    return imageDataEncodedString;
}
-(NSMutableDictionary*)generateParameter{
    NSString *strTitle = self.txtTitle.text;
    NSString *strDescription =self.txtWarning.text;
    NSString *strLocation = self.txtLocation.text;
    NSString *strTime = self.lbTime.text;
    NSString *strPhone = self.txtPhone.text;
    // Convert image to base64 string
    NSDictionary *imageType1 = nil;
    NSDictionary *imageContent1 = nil;
    NSDictionary *imageType2 = nil;
    NSDictionary *imageContent2 = nil;
    NSDictionary *imageType3 = nil;
    NSDictionary *imageContent3 = nil;
    NSDictionary *imageType4 = nil;
    NSDictionary *imageContent4 = nil;
    //self.image1  = [UIImage imageNamed:@"ic_100_places.png"];
    if (self.image1 !=nil) {
        numberImage = numberImage + 1;
        imageType1 = @{@"extension_0":@"png"};
        imageContent1 =@{@"image_0_base64": [self imageToBase64String:self.image1]};
        
    }
    if (self.image2 !=nil) {
        numberImage = numberImage + 1;
        imageType2 = @{@"extension_1":@"png"};
        imageContent2 =@{@"image_1_base64": [self imageToBase64String:self.image2]};
    }
    if (self.image3 !=nil) {
        numberImage = numberImage + 1;
        imageType3 = @{@"extension_2":@"png"};
        imageContent3 =@{@"image_2_base64": [self imageToBase64String:self.image3]};
    }
    if (self.image4 !=nil) {
        numberImage = numberImage + 1;
        imageType4 = @{@"extension_3":@"png"};
       imageContent4 =@{@"image_3_base64": [self imageToBase64String:self.image4]};
    }
    NSString *strImageNumber = [NSString stringWithFormat:@"%d",numberImage];
    NSMutableDictionary *dictPara = [NSMutableDictionary new];
    NSDictionary *dictInfo = @{@"title":strTitle,@"content":strDescription,@"address":strLocation,
                                      @"mobile_number":strPhone,@"datetime":strTime,@"number_image":strImageNumber};
    [dictPara addEntriesFromDictionary:dictInfo];
    [dictPara addEntriesFromDictionary:imageType1];
    [dictPara addEntriesFromDictionary:imageContent1];
    [dictPara addEntriesFromDictionary:imageType2];
    [dictPara addEntriesFromDictionary:imageContent2];
    [dictPara addEntriesFromDictionary:imageType3];
    [dictPara addEntriesFromDictionary:imageContent3];
    [dictPara addEntriesFromDictionary:imageType4];
    [dictPara addEntriesFromDictionary:imageContent4];
    return dictPara;
}

@end
