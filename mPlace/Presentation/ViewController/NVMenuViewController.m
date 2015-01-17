//
//  NVMenuViewController.m
//  mPlace
//
//  Created by hehe on 9/26/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVMenuViewController.h"
#import "NVWeatherTableViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface NVMenuViewController (){

    NSArray * titleCellFirst;
    NSArray * titleCellSecond;
    NSArray * imagesFirst;
    NSArray * imagesSecond;
    NVWeatherTableViewController * _weather;
    CGRect  standardFrame;
    CGRect  hiddenFrame;
}

@end

@implementation NVMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _weather = [[NVWeatherTableViewController alloc] initWithNibName:@"NVWeatherTableViewController" bundle:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [Ultility colorWithHexString:@"0xeeeeee"];
    
    standardFrame = CGRectMake(0, _banner.frame.origin.y + 20, _weather.view.frame.size.width, _weather.view.frame.size.height);
    hiddenFrame = CGRectMake(0, _banner.frame.origin.y, _weather.view.frame.size.width, 0);
    
    _weather.view.frame = hiddenFrame;
    _weather.view.alpha = 0;
    [self.view addSubview:_weather.view];
    
    _scroll.contentSize = CGSizeMake(_scroll.frame.size.width, _viewContent.frame.size.height);
    _scroll.pagingEnabled = NO;
    [_scroll addSubview:_viewContent];
    
    titleCellFirst = [NSArray arrayWithObjects:@"Trang chủ",@"Tư vấn tour du lịch",@"Tin tức du lịch",@"Địa điểm hot",@"Địa điểm đã lưu",@"Tìm kiếm",@"360º Giao thông",@"Âm nhạc dân gian",@"Đăng nhập wifi", nil];
    
    if (FBSession.activeSession.isOpen){
        titleCellSecond = [NSArray arrayWithObjects:@"Tuỳ chọn",@"Hỗ trợ",@"Thoát", nil];
        _avatar.hidden = NO;
        _name.hidden   = NO;
        [[Ultility shareInstant] setStatusLogin:@1];
    }else{
        titleCellSecond = [NSArray arrayWithObjects:@"Tuỳ chọn",@"Hỗ trợ",@"Đăng nhập", nil];
        _avatar.hidden = YES;
        _name.hidden   = YES;
        [[Ultility shareInstant] setStatusLogin:@0];
    }
    
    imagesFirst= [NSArray arrayWithObjects:@"ic_menu_home.png",@"icontuvan1.jpg",@"ic_menu_news.png",@"ic_100_places.png",@"ic_menu_placesave.png",@"ic_menu_search.png",@"360.jpg",@"music.png",@"ic_menu_config.png", nil];
    imagesSecond = [NSArray arrayWithObjects:@"ic_menu_config.png",@"ic_menu_help.png",@"ic_menu_power.png", nil];
    // Do any additional setup after loading the view from its nib.
    
    UIImage * image = _avatar.image;
    
    UIGraphicsBeginImageContextWithOptions(_avatar.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:_avatar.bounds
                                cornerRadius:40.0] addClip];
    [image drawInRect:_avatar.bounds];
    _avatar.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TABLEVIEW DATASOURCE

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == _tblMenuFirst) return titleCellFirst.count;
    else return titleCellSecond.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"Identify";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    if(_tblMenuFirst == tableView){
        cell.textLabel.text = [titleCellFirst objectAtIndex:indexPath.row];
        UIImage * image = [UIImage imageNamed:[imagesFirst objectAtIndex:indexPath.row]];
        //cell.imageView.frame = CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, image.size.width, image.size.height);
        //NSLog(@"%@",imagesSecond);
        cell.imageView.image = image;
    }else{
        cell.textLabel.text = [titleCellSecond objectAtIndex:indexPath.row];
        UIImage * image = [UIImage imageNamed:[imagesSecond objectAtIndex:indexPath.row]];
        //cell.imageView.frame = CGRectMake(cell.imageView.frame.origin.x, cell.imageView.frame.origin.y, image.size.width, image.size.height);
        cell.imageView.image = image;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.backgroundColor = [UIColor clearColor];
    
    UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, cell.contentView.frame.origin.y, 280, 0.5)];
    lbl.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:lbl];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger index = 0;
    
    if(tableView == _tblMenuFirst){
        switch (indexPath.row) {
            case 0:
            {
                index = 0;//Trang chu
            }
                break;
            case 1:
            {
                index = 1;//Tu Van Tour
            }
                break;
            case 2:
            {
                index = 2;//Tin tuc
            }
                break;
            case 3:
            {
                index = 3;//Dia diem hot
            }
                break;
            case 4:
            {
                index = 4;//Dia diem lu
            }
                break;
            case 5:
            {
                index = 5;//Tim kiem
            }
                break;
            case 6:
            {
                index = 6;//360
            }
                break;
            case 7:
            {
                index = 7;//Am nhac
            }
                break;
            case 8:
            {
                index = 8; //handle wifi index = 8
            }
                break;
            default:
                break;
        }
        
    }
    
    if(tableView == _tblMenuSecond){
        switch (indexPath.row) {
            case 0:
            {
                index = 9;
            }
                break;
            case 1:
            {
                index = 10;
            }
                break;
            case 2:
            {
                index = 11;
            }
                break;
            default:
                break;
        }
        
    }
    
    [Appdelegate handleMenu:index];
}

- (IBAction)handleWifi:(id)sender{
    NSInteger index = 8;
    [Appdelegate handleMenu:index];
}

- (IBAction)handleWeather:(UIButton*)sender{
    if(sender.tag == 0){
        sender.tag = 1;
        [UIView animateWithDuration:0.5 animations:^{
            _weather.view.frame = standardFrame;
            _weather.view.alpha = 1;
        }];
        
    }else{
        sender.tag = 0;
        [UIView animateWithDuration:0.5 animations:^{
            _weather.view.frame = hiddenFrame;
            _weather.view.alpha = 0;
        }];
    }

}

- (void)loginFB{
    
    if([[[Ultility shareInstant] statusLogin] isEqualToNumber:@1]){
        _avatar.hidden = YES;
        _name.hidden = YES;
        
         titleCellSecond = [NSArray arrayWithObjects:@"Tuỳ chọn",@"Hỗ trợ",@"Đăng nhập", nil];
        [_tblMenuSecond reloadData];
        [[Ultility shareInstant] setStatusLogin:@0];
        
        return;
    }
    
    if (FBSession.activeSession.isOpen) {
        NSLog(@"session đã khởi tạo");
        //titleCellSecond = [NSArray arrayWithObjects:@"Tuỳ chọn",@"Hỗ trợ",@"Thoát", nil];
        //[_tblMenuSecond reloadData];
        
        
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
//                 NSString *firstName = user.first_name;
//                 NSString *lastName = user.last_name;
                 _name.text = [user objectForKey:@"name"];
                  //NSString *email = [user objectForKey:@"email"];
             
                 [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *FBuser, NSError *error) {
                     if (error) {
                         // Handle error
                     }
                     
                     else {
                         
                         titleCellSecond = [NSArray arrayWithObjects:@"Tuỳ chọn",@"Hỗ trợ",@"Thoát", nil];
                         [[Ultility shareInstant] setStatusLogin:@1];
                         [_tblMenuSecond reloadData];
                         
                         _avatar.hidden = NO;
                         _name.hidden   = NO;
                         
                         UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [FBuser objectID]]]]];
                         
                         UIGraphicsBeginImageContextWithOptions(_avatar.bounds.size, NO, [UIScreen mainScreen].scale);
                         [[UIBezierPath bezierPathWithRoundedRect:_avatar.bounds
                                                     cornerRadius:40.0] addClip];
                         [image drawInRect:_avatar.bounds];
                         _avatar.image = UIGraphicsGetImageFromCurrentImageContext();
                         
                         UIGraphicsEndImageContext();
                         _avatar.layer.borderWidth = 5.0f;
                         _avatar.layer.borderColor = [[UIColor clearColor] CGColor];
                     }
                 }];
             }
         }];
    }else{
        NSLog(@"chưa có session, cần khởi tạo mới");
        titleCellSecond = [NSArray arrayWithObjects:@"Tuỳ chọn",@"Hỗ trợ",@"Đăng nhập", nil];
        [_tblMenuSecond reloadData];
        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile,email,user_friends,user_birthday"] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            
            if(error){
                NSLog(@" loi trong khi khoi tao session");
            }
            
            if(status != FBSessionStateOpen){
                NSLog(@" loi session ko open");
            }
            
            if (!error && status == FBSessionStateOpen) {
                [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                    NSDictionary *user = (NSDictionary *)result;
                    
                                    _name.text   = [user objectForKey:@"name"];
                    [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *FBuser, NSError *error) {
                        if (error) {
                            // Handle error
                        }
                        
                        else {
                            
                            titleCellSecond = [NSArray arrayWithObjects:@"Tuỳ chọn",@"Hỗ trợ",@"Thoát", nil];
                            [[Ultility shareInstant] setStatusLogin:@1];
                            [_tblMenuSecond reloadData];
                            
                            _avatar.hidden = NO;
                            _name.hidden   = NO;
                            
                            UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [FBuser objectID]]]]];
                            
                                                    UIGraphicsBeginImageContextWithOptions(_avatar.bounds.size, NO, [UIScreen mainScreen].scale);
                                                    [[UIBezierPath bezierPathWithRoundedRect:_avatar.bounds
                                                                                cornerRadius:40.0] addClip];
                                                    [image drawInRect:_avatar.bounds];
                                                    _avatar.image = UIGraphicsGetImageFromCurrentImageContext();
                            
                                                    UIGraphicsEndImageContext();
                                                    _avatar.layer.borderWidth = 5.0f;
                                                    _avatar.layer.borderColor = [[UIColor clearColor] CGColor];
                        }
                    }];
                }];
                
            }
        }];
    }
    
    
}

@end
