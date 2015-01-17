//
//  NVDiaDiemDatabase.m
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVDiaDiemDatabase.h"
#import "NVDiaDiem.h"

#define kDiaDiemTable @"DiaDiem"

#define kDiadiemColumnID @"IDdiadiem"
#define kDiadiemColumnTenDiadiem @"tenDiaDiem"
#define kDiadiemColumnDiaChi @"diaChi"
#define kDiadiemColumnTuKhoaTimkiem @"tuKhoaTimKiem"
#define kDiadiemColumnDes @"description"
#define kDiadiemColumnLatitude @"latitube"
#define kDiadiemColumnLongitude @"longitube"
#define kDiadiemColumnGioithieu @"gioiThieu"
#define kDiadiemColumnParonama @"paronama"
#define kDiadiemColumnAnhGocRong @"anhGocRong"
#define kDiadiemColumnAnhNho @"anhNho"
#define kDiadiemColumnAnhKhac @"anhKhac"
#define kDiadiemColumnKhoangCach @"khoangCach"
#define kDiadiemColumnSoluotView @"soLuotView"
#define kDiadiemColumnSoluotVote @"soLuotVote"
#define kDiadiemColumnIDFromServer @"IDFromServer"
#define kDiadiemColumnMusic @"music"
#define kDiadiemColumnAudio @"audio"
#define kDiadiemColumnVideolink @"videoLink"
#define kDiadiemColumnDiaDiemLienquan @"diaDiemLienQuan"
#define kDiadiemColumnThongtinHot @"thongtinHot"
#define kDiadiemColumnPhuongtien @"phuongTien"
@implementation NVDiaDiemDatabase


- (id)init{
    self = [super init];
    if(self){

    }
    
    return self;
}


- (BOOL)insertBookMark:(NVDiaDiem *)nvDiadiem{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[Ultility getDataBasePath]];
    NVDiaDiem * obj = nvDiadiem;
    [queue inDatabase:^(FMDatabase *db) {
        
        //[db executeUpdate:@"INSERT INTO Bookmark VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", obj.IDdiadiem,obj.TenDiaDiem,obj.DiaChi,obj.TuKhoaTimKiem,obj.Description,obj.Latitube,obj.Longtitube,obj.GioiThieu,obj.PanoramaLink,obj.AnhGocRongLink,obj.AnhNhoLink,obj.AnhKhacLink,obj.Distance,obj.ViewCount,obj.VoteCount,obj.IDServer,obj.musicLink,obj.audioLink,obj.videoLink,obj.diadiemLienquan,obj.thongtinHot,obj.phuongtien];
        [db executeUpdate:@"INSERT INTO Bookmark VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", obj.IDdiadiem,obj.TenDiaDiem,obj.DiaChi,obj.TuKhoaTimKiem,obj.Description,obj.Latitube,obj.Longtitube,obj.GioiThieu,obj.PanoramaLink,obj.AnhGocRongLink,obj.AnhNhoLink,obj.AnhKhacLink,obj.Distance,obj.ViewCount,obj.VoteCount,obj.IDServer,obj.musicLink,obj.audioLink,obj.videoLink,obj.diadiemLienquan,obj.thongtinHot,obj.phuongtien,obj.typeDiaDiem,obj.introduction, obj.honor, obj.typeOther, obj.tenKhongDau];
        
        NSLog(@"bookmark thanh cong");
    }];
    return YES;
}

- (BOOL)DeleteBookMarkWithDiaDiem:(NVDiaDiem *)nvDiadiem{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[Ultility getDataBasePath]];
    NSString * strQuery = [NSString stringWithFormat:@"DELETE FROM Bookmark Where IDBookmark = %@",nvDiadiem.IDdiadiem];
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:strQuery];
    }];
    
    return YES;

}


- (BOOL) insertDiaDiemIntoDatabase:(NSArray*) arrDiadiem{
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[Ultility getDataBasePath]];
    [queue inDatabase:^(FMDatabase *db) {
        for(NVDiaDiem * obj in arrDiadiem){
            [db executeUpdate:@"INSERT INTO DiaDiem VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", obj.IDdiadiem,obj.TenDiaDiem,obj.DiaChi,obj.TuKhoaTimKiem,obj.Description,obj.Latitube,obj.Longtitube,obj.GioiThieu,obj.PanoramaLink,obj.AnhGocRongLink,obj.AnhNhoLink,obj.AnhKhacLink,obj.Distance,obj.ViewCount,obj.VoteCount,obj.IDServer,obj.musicLink,obj.audioLink,obj.videoLink,obj.diadiemLienquan,obj.thongtinHot,obj.phuongtien,obj.typeDiaDiem,obj.introduction, obj.honor, obj.typeOther, obj.tenKhongDau];
        }
        NSLog(@"inser all dia diem thanh cong");
    }];
    
    return YES;
}

- (BOOL) deleteAllDataInDatabase{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[Ultility getDataBasePath]];
    [queue inDatabase:^(FMDatabase *db) {
        db = [FMDatabase databaseWithPath:[Ultility getDataBasePath]];
        if([db open])
            [db executeUpdate:@"DELETE FROM DiaDiem"];
    }];
    return YES;
}

- (BOOL)checkBookmark:(NVDiaDiem*) nvDiadiem{
    FMDatabase * db = [FMDatabase databaseWithPath:[Ultility getDataBasePath]];
    if (![db open]) {
        NSLog(@"db not open");
        return NO;
    }
    NSString * query = [NSString stringWithFormat:@"SELECT * FROM Bookmark Where IDBookmark = %@",nvDiadiem.IDdiadiem];
    FMResultSet *s = [db executeQuery:query];
    NSInteger count = 0;
    while ([s next]) {
        count++;
    }
    
    if(count>0) return YES;
    else return NO;
}

- (NVDiaDiem*) getDiaDiemFromDBWithID:(NSNumber*)idDiaDiem{
    FMDatabase * db = [FMDatabase databaseWithPath:[Ultility getDataBasePath]];
    if (![db open]) {
        NSLog(@"db not open");
        return nil;
    }
    NSString * query = [NSString stringWithFormat:@"SELECT * FROM DiaDiem WHERE IDdiadiem = %@",idDiaDiem];
    FMResultSet *s = [db executeQuery:query];
    NSMutableArray * array = [[NSMutableArray alloc] init];
    while ([s next]) {
        NVDiaDiem * diadiem = [[NVDiaDiem alloc] init];
        diadiem.IDdiadiem = [NSNumber numberWithInt:[s intForColumnIndex:0] ];
        diadiem.TenDiaDiem    = [s stringForColumnIndex:1]?[s stringForColumnIndex:1]:@"";
        diadiem.DiaChi  = [s stringForColumnIndex:2]?[s stringForColumnIndex:2]:@"";
        diadiem.TuKhoaTimKiem = [s stringForColumnIndex:3]?[s stringForColumnIndex:3]:@"";
        diadiem.Description = [s stringForColumnIndex:4]?[s stringForColumnIndex:4]:@"";
        diadiem.Latitube = [s stringForColumnIndex:5]?[s stringForColumnIndex:5]:@"";
        
        diadiem.Longtitube    = [s stringForColumnIndex:6]?[s stringForColumnIndex:6]:@"";
        //diadiem.DiaChi  = [s stringForColumnIndex:7];
        diadiem.GioiThieu = [s stringForColumnIndex:7]?[s stringForColumnIndex:7]:@"";
        diadiem.PanoramaLink = [s stringForColumnIndex:8]?[s stringForColumnIndex:8]:@"";
        diadiem.AnhGocRongLink = [s stringForColumnIndex:9]?[s stringForColumnIndex:9]:@"";
        
        diadiem.AnhNhoLink  = [s stringForColumnIndex:10]?[s stringForColumnIndex:10]:@"";
        diadiem.AnhKhacLink = [s stringForColumnIndex:11]?[s stringForColumnIndex:11]:@"";
        diadiem.Distance = [s stringForColumnIndex:12]?[s stringForColumnIndex:12]:@"";
        diadiem.ViewCount = [s stringForColumnIndex:13]?[s stringForColumnIndex:13]:@"";
        diadiem.VoteCount  = [s stringForColumnIndex:14]?[s stringForColumnIndex:14]:@"";
        
        diadiem.IDServer = [s stringForColumnIndex:15]?[s stringForColumnIndex:15]:@"";
        diadiem.musicLink = [s stringForColumnIndex:16]?[s stringForColumnIndex:16]:@"";
        diadiem.audioLink = [s stringForColumnIndex:17]?[s stringForColumnIndex:17]:@"";
        diadiem.videoLink = [s stringForColumnIndex:18]?[s stringForColumnIndex:18]:@"";
        diadiem.diadiemLienquan  = [s stringForColumnIndex:19]?[s stringForColumnIndex:19]:@"";
        diadiem.thongtinHot = [s stringForColumnIndex:20]?[s stringForColumnIndex:20]:@"";
        
        diadiem.phuongtien = [s stringForColumnIndex:21]?[s stringForColumnIndex:21]:@"";
        diadiem.typeDiaDiem = [s stringForColumnIndex:22]?[s stringForColumnIndex:22]:@"";
        diadiem.introduction = [s stringForColumnIndex:23]?[s stringForColumnIndex:23]:@"";
        diadiem.honor        = [s stringForColumnIndex:24]?[s stringForColumnIndex:24]:@"";
        diadiem.typeOther    = [s stringForColumnIndex:25]?[s stringForColumnIndex:25]:@"";
        diadiem.tenKhongDau  = [s stringForColumnIndex:26]?[s stringForColumnIndex:26]:@"";
        
        [array addObject:diadiem];
    }
    if(array.count > 0)
        return [array objectAtIndex:0];
    else
        return nil;
}

- (void)allBookmarkFromDB:(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock {
    FMDatabase * db = [FMDatabase databaseWithPath:[Ultility getDataBasePath]];
    if (![db open]) {
        NSError * error;
        NSLog(@"db not open");
        failBlock(error);
        return;
    }
    
    FMResultSet *s = [db executeQuery:@"SELECT * FROM Bookmark"];
    NSMutableArray * array = [[NSMutableArray alloc] init];
    while ([s next]) {
        NVDiaDiem * diadiem = [[NVDiaDiem alloc] init];
        diadiem.IDdiadiem = [NSNumber numberWithInt:[s intForColumnIndex:0] ];
        diadiem.TenDiaDiem    = [s stringForColumnIndex:1]?[s stringForColumnIndex:1]:@"";
        diadiem.DiaChi  = [s stringForColumnIndex:2]?[s stringForColumnIndex:2]:@"";
        diadiem.TuKhoaTimKiem = [s stringForColumnIndex:3]?[s stringForColumnIndex:3]:@"";
        diadiem.Description = [s stringForColumnIndex:4]?[s stringForColumnIndex:4]:@"";
        diadiem.Latitube = [s stringForColumnIndex:5]?[s stringForColumnIndex:5]:@"";
        
        diadiem.Longtitube    = [s stringForColumnIndex:6]?[s stringForColumnIndex:6]:@"";
        //diadiem.DiaChi  = [s stringForColumnIndex:7];
        diadiem.GioiThieu = [s stringForColumnIndex:7]?[s stringForColumnIndex:7]:@"";
        diadiem.PanoramaLink = [s stringForColumnIndex:8]?[s stringForColumnIndex:8]:@"";
        diadiem.AnhGocRongLink = [s stringForColumnIndex:9]?[s stringForColumnIndex:9]:@"";
        
        diadiem.AnhNhoLink  = [s stringForColumnIndex:10]?[s stringForColumnIndex:10]:@"";
        diadiem.AnhKhacLink = [s stringForColumnIndex:11]?[s stringForColumnIndex:11]:@"";
        diadiem.Distance = [s stringForColumnIndex:12]?[s stringForColumnIndex:12]:@"";
        diadiem.ViewCount = [s stringForColumnIndex:13]?[s stringForColumnIndex:13]:@"";
        diadiem.VoteCount  = [s stringForColumnIndex:14]?[s stringForColumnIndex:14]:@"";
        
        diadiem.IDServer = [s stringForColumnIndex:15]?[s stringForColumnIndex:15]:@"";
        diadiem.musicLink = [s stringForColumnIndex:16]?[s stringForColumnIndex:16]:@"";
        diadiem.audioLink = [s stringForColumnIndex:17]?[s stringForColumnIndex:17]:@"";
        diadiem.videoLink = [s stringForColumnIndex:18]?[s stringForColumnIndex:18]:@"";
        diadiem.diadiemLienquan  = [s stringForColumnIndex:19]?[s stringForColumnIndex:19]:@"";
        diadiem.thongtinHot = [s stringForColumnIndex:20]?[s stringForColumnIndex:20]:@"";
        
        diadiem.phuongtien = [s stringForColumnIndex:21]?[s stringForColumnIndex:21]:@"";
        
        [array addObject:diadiem];
    }
    sucBlock([array copy]);
    
    [db close];
}

-(void)allDiaDiemFromDBSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock{
    FMDatabase * db = [FMDatabase databaseWithPath:[Ultility getDataBasePath]];
    if (![db open]) {
        NSError * error;
        NSLog(@"db not open");
        failBlock(error);
        return;
    }
    //NSString * result = @"SELECT * FROM DiaDiem ORDER BY idDiaDiem DESC"
    FMResultSet *s = [db executeQuery:@"SELECT * FROM DiaDiem ORDER BY idDiaDiem DESC"];
    NSMutableArray * array = [[NSMutableArray alloc] init];
    while ([s next]) {
        NVDiaDiem * diadiem = [[NVDiaDiem alloc] init];
        diadiem.IDdiadiem = [NSNumber numberWithInt:[s intForColumnIndex:0] ];
        diadiem.TenDiaDiem    = [s stringForColumnIndex:1]?[s stringForColumnIndex:1]:@"";
        diadiem.DiaChi  = [s stringForColumnIndex:2]?[s stringForColumnIndex:2]:@"";
        diadiem.TuKhoaTimKiem = [s stringForColumnIndex:3]?[s stringForColumnIndex:3]:@"";
        diadiem.Description = [s stringForColumnIndex:4]?[s stringForColumnIndex:4]:@"";
        diadiem.Latitube = [s stringForColumnIndex:5]?[s stringForColumnIndex:5]:@"";
        
        diadiem.Longtitube    = [s stringForColumnIndex:6]?[s stringForColumnIndex:6]:@"";
        //diadiem.DiaChi  = [s stringForColumnIndex:7];
        diadiem.GioiThieu = [s stringForColumnIndex:7]?[s stringForColumnIndex:7]:@"";
        diadiem.PanoramaLink = [s stringForColumnIndex:8]?[s stringForColumnIndex:8]:@"";
        diadiem.AnhGocRongLink = [s stringForColumnIndex:9]?[s stringForColumnIndex:9]:@"";
        
        diadiem.AnhNhoLink  = [s stringForColumnIndex:10]?[s stringForColumnIndex:10]:@"";
        diadiem.AnhKhacLink = [s stringForColumnIndex:11]?[s stringForColumnIndex:11]:@"";
        diadiem.Distance = [s stringForColumnIndex:12]?[s stringForColumnIndex:12]:@"";
        diadiem.ViewCount = [s stringForColumnIndex:13]?[s stringForColumnIndex:13]:@"";
        diadiem.VoteCount  = [s stringForColumnIndex:14]?[s stringForColumnIndex:14]:@"";
        
        diadiem.IDServer = [s stringForColumnIndex:15]?[s stringForColumnIndex:15]:@"";
        diadiem.musicLink = [s stringForColumnIndex:16]?[s stringForColumnIndex:16]:@"";
        diadiem.audioLink = [s stringForColumnIndex:17]?[s stringForColumnIndex:17]:@"";
        diadiem.videoLink = [s stringForColumnIndex:18]?[s stringForColumnIndex:18]:@"";
        diadiem.diadiemLienquan  = [s stringForColumnIndex:19]?[s stringForColumnIndex:19]:@"";
        diadiem.thongtinHot = [s stringForColumnIndex:20]?[s stringForColumnIndex:20]:@"";
        
        diadiem.phuongtien = [s stringForColumnIndex:21]?[s stringForColumnIndex:21]:@"";
        
        [array addObject:diadiem];
    }
    sucBlock([array copy]);
    
    [db close];
}

- (BOOL)insertTable:(NSString *)tableName withParams:(NSDictionary *)params inDB:(FMDatabase *)database{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[Ultility getDataBasePath]];
     NSArray *allKeys = [params allKeys];
    NSMutableString *sql = [[NSMutableString alloc] init];
    [queue inDatabase:^(FMDatabase *db) {
        [sql appendFormat:@"INSERT INTO %@(%@) VALUES (:%@)",tableName, [allKeys componentsJoinedByString:@","],[allKeys componentsJoinedByString:@",:"]];
        [db executeUpdate:sql withParameterDictionary:params];
    }];
    return YES;
}

- (NVDiaDiem*) _parserDiaDiemFromServer:(FMResultSet*)s{
    NVDiaDiem * diadiem = [[NVDiaDiem alloc] init];
    diadiem.IDdiadiem = [NSNumber numberWithInt:[s intForColumnIndex:0] ];
    diadiem.TenDiaDiem    = [s stringForColumnIndex:1]?[s stringForColumnIndex:1]:@"";
    diadiem.DiaChi  = [s stringForColumnIndex:2]?[s stringForColumnIndex:2]:@"";
    diadiem.TuKhoaTimKiem = [s stringForColumnIndex:3]?[s stringForColumnIndex:3]:@"";
    diadiem.Description = [s stringForColumnIndex:4]?[s stringForColumnIndex:4]:@"";
    diadiem.Latitube = [s stringForColumnIndex:5]?[s stringForColumnIndex:5]:@"";
    
    diadiem.Longtitube    = [s stringForColumnIndex:6]?[s stringForColumnIndex:6]:@"";
    //diadiem.DiaChi  = [s stringForColumnIndex:7];
    diadiem.GioiThieu = [s stringForColumnIndex:7]?[s stringForColumnIndex:7]:@"";
    diadiem.PanoramaLink = [s stringForColumnIndex:8]?[s stringForColumnIndex:8]:@"";
    diadiem.AnhGocRongLink = [s stringForColumnIndex:9]?[s stringForColumnIndex:9]:@"";
    
    diadiem.AnhNhoLink  = [s stringForColumnIndex:10]?[s stringForColumnIndex:10]:@"";
    diadiem.AnhKhacLink = [s stringForColumnIndex:11]?[s stringForColumnIndex:11]:@"";
    diadiem.Distance = [s stringForColumnIndex:12]?[s stringForColumnIndex:12]:@"";
    diadiem.ViewCount = [s stringForColumnIndex:13]?[s stringForColumnIndex:13]:@"";
    diadiem.VoteCount  = [s stringForColumnIndex:14]?[s stringForColumnIndex:14]:@"";
    
    diadiem.IDServer = [s stringForColumnIndex:15]?[s stringForColumnIndex:15]:@"";
    diadiem.musicLink = [s stringForColumnIndex:16]?[s stringForColumnIndex:16]:@"";
    diadiem.audioLink = [s stringForColumnIndex:17]?[s stringForColumnIndex:17]:@"";
    diadiem.videoLink = [s stringForColumnIndex:18]?[s stringForColumnIndex:18]:@"";
    diadiem.diadiemLienquan  = [s stringForColumnIndex:19]?[s stringForColumnIndex:19]:@"";
    diadiem.thongtinHot = [s stringForColumnIndex:20]?[s stringForColumnIndex:20]:@"";
    diadiem.phuongtien = [s stringForColumnIndex:21]?[s stringForColumnIndex:21]:@"";
    
    return diadiem;
}


- (NSArray*) getAllDiaDiemInDatabase{
    
    return nil;
}

@end
