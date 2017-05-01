//
//  ViewController.m
//  ASDK_Demo
//
//  Created by 李国平 on 2017/4/14.
//  Copyright © 2017年 gpl. All rights reserved.
//

#import "ViewController.h"
#import "NormalTableViewController.h"
#import "NormalCollectionViewController.h"
#import "ASDKTableViewController.h"
#import "ASDKCollectionViewController.h"

@interface ViewController () 

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dataArray = [NSMutableArray arrayWithArray:
                      @[@"http://oneshow.img.nagezan.net/7f5e12dc-eaf2-4125-98cb-feafb7ba36ba.jpg",
                       @"http://oneshow.img.nagezan.net/78173537-9a7e-45d2-b61b-73cf1ba75723.png",
                       @"http://oneshow.img.nagezan.net/dd49ca2e-5007-40a0-8a29-9693620c8a50.jpg",
                       @"http://oneshow.img.nagezan.net/8a3d235a-d565-49ef-9b4d-5ecc60acb06d.jpg",
                       @"http://oneshow.img.nagezan.net/a29b9174-aab1-4fa6-a3a8-dfca24a5d3df.png",
                       @"http://oneshow.img.nagezan.net/782a436c-0a9a-4069-9da6-68883ceab02f.jpg",
                       @"http://oneshow.img.nagezan.net/03cc3ac2-3be1-4b9f-a799-003b3dc5926a.png",
                       @"http://oneshow.img.nagezan.net/c861b281-95a2-4f92-80fa-3fc30eeaa5c9.jpg",
                       @"http://oneshow.img.nagezan.net/6040010f-a3d2-460b-8ac5-b4797dd9d69f.jpg",
                       @"http://oneshow.img.nagezan.net/cd7cf0d0-8a8c-4c61-aeb1-54385cda9511.jpg",
                       @"http://oneshow.img.nagezan.net/00e5e18e-8ad6-4537-bcb2-057c87a8470f.png",
                       @"http://oneshow.img.nagezan.net/4d59709a-dc6a-4a9b-baf2-f0447f1dd2f5.jpg",
                       @"http://oneshow.img.nagezan.net/9ed9c475-cf53-454a-9c7a-88c7e2640477.png",
                       @"http://oneshow.img.nagezan.net/e1d4c94c-5a07-40f9-9408-8bd65f4d64fd.png",
                       @"http://oneshow.img.nagezan.net/7cb6f817-3ef9-4a43-ac03-a09b03a3830b.png",
                       @"http://oneshow.img.nagezan.net/d9f90a84-ab62-49cd-9f2d-b431ff52d8f2.png",
                       @"http://oneshow.img.nagezan.net/97fb68cd-e3c7-4cda-b64f-26047632cc76.png",
                       @"http://oneshow.img.nagezan.net/fbb8fd68-04f6-4a93-8463-b70b2a90be0c.png",
                       @"http://oneshow.img.nagezan.net/20e09288-0b45-40ed-b6de-0cc5600da2e8.jpg",
                       @"http://oneshow.img.nagezan.net/ed0482f7-2f5e-490f-b302-c9bb47d60de6.png",
                       @"http://wx.qlogo.cn/mmopen/v8LvcSSeusLSjIic2HUicRibQYq5gGomA1mm4Ahj0HiavicTfdEs6Buh4eQ1yckM9t3FfiaCt8rstK1XIJboBTLkM0Ma8Pcial34pnv/0",
                       @"http://oneshow.img.nagezan.net/9a6b18b9-b01d-4647-bc2a-2217c6ec92c9.jpg",
                       @"http://oneshow.img.nagezan.net/2dc8a8d9-dc00-425d-a94b-7575c12303ed.png",
                       @"http://oneshow.img.nagezan.net/21d11622-0651-4c24-a4df-9d3e2a7fe38f.jpg",
                       @"http://oneshow.img.nagezan.net/7f5e12dc-eaf2-4125-98cb-feafb7ba36ba.jpg",
                       @"http://oneshow.img.nagezan.net/78173537-9a7e-45d2-b61b-73cf1ba75723.png",
                       @"http://oneshow.img.nagezan.net/dd49ca2e-5007-40a0-8a29-9693620c8a50.jpg",
                       @"http://oneshow.img.nagezan.net/8a3d235a-d565-49ef-9b4d-5ecc60acb06d.jpg",
                       @"http://oneshow.img.nagezan.net/a29b9174-aab1-4fa6-a3a8-dfca24a5d3df.png",
                       @"http://oneshow.img.nagezan.net/782a436c-0a9a-4069-9da6-68883ceab02f.jpg",
                       @"http://oneshow.img.nagezan.net/03cc3ac2-3be1-4b9f-a799-003b3dc5926a.png",
                       @"http://oneshow.img.nagezan.net/c861b281-95a2-4f92-80fa-3fc30eeaa5c9.jpg",
                       @"http://oneshow.img.nagezan.net/6040010f-a3d2-460b-8ac5-b4797dd9d69f.jpg",
                       @"http://oneshow.img.nagezan.net/cd7cf0d0-8a8c-4c61-aeb1-54385cda9511.jpg",
                       @"http://oneshow.img.nagezan.net/00e5e18e-8ad6-4537-bcb2-057c87a8470f.png",
                       @"http://oneshow.img.nagezan.net/4d59709a-dc6a-4a9b-baf2-f0447f1dd2f5.jpg",
                       @"http://oneshow.img.nagezan.net/9ed9c475-cf53-454a-9c7a-88c7e2640477.png",
                       @"http://oneshow.img.nagezan.net/e1d4c94c-5a07-40f9-9408-8bd65f4d64fd.png",
                       @"http://oneshow.img.nagezan.net/7cb6f817-3ef9-4a43-ac03-a09b03a3830b.png",
                       @"http://oneshow.img.nagezan.net/d9f90a84-ab62-49cd-9f2d-b431ff52d8f2.png",
                       @"http://oneshow.img.nagezan.net/97fb68cd-e3c7-4cda-b64f-26047632cc76.png",
                       @"http://oneshow.img.nagezan.net/fbb8fd68-04f6-4a93-8463-b70b2a90be0c.png",
                       @"http://oneshow.img.nagezan.net/20e09288-0b45-40ed-b6de-0cc5600da2e8.jpg",
                       @"http://oneshow.img.nagezan.net/ed0482f7-2f5e-490f-b302-c9bb47d60de6.png",
                       @"http://wx.qlogo.cn/mmopen/v8LvcSSeusLSjIic2HUicRibQYq5gGomA1mm4Ahj0HiavicTfdEs6Buh4eQ1yckM9t3FfiaCt8rstK1XIJboBTLkM0Ma8Pcial34pnv/0",
                       @"http://oneshow.img.nagezan.net/9a6b18b9-b01d-4647-bc2a-2217c6ec92c9.jpg",
                       @"http://oneshow.img.nagezan.net/2dc8a8d9-dc00-425d-a94b-7575c12303ed.png",
                       @"http://oneshow.img.nagezan.net/21d11622-0651-4c24-a4df-9d3e2a7fe38f.jpg",
                       @"http://oneshow.img.nagezan.net/7f5e12dc-eaf2-4125-98cb-feafb7ba36ba.jpg",
                       @"http://oneshow.img.nagezan.net/78173537-9a7e-45d2-b61b-73cf1ba75723.png",
                       @"http://oneshow.img.nagezan.net/dd49ca2e-5007-40a0-8a29-9693620c8a50.jpg",
                       @"http://oneshow.img.nagezan.net/8a3d235a-d565-49ef-9b4d-5ecc60acb06d.jpg",
                       @"http://oneshow.img.nagezan.net/a29b9174-aab1-4fa6-a3a8-dfca24a5d3df.png",
                       @"http://oneshow.img.nagezan.net/782a436c-0a9a-4069-9da6-68883ceab02f.jpg",
                       @"http://oneshow.img.nagezan.net/03cc3ac2-3be1-4b9f-a799-003b3dc5926a.png",
                       @"http://oneshow.img.nagezan.net/c861b281-95a2-4f92-80fa-3fc30eeaa5c9.jpg",
                       @"http://oneshow.img.nagezan.net/6040010f-a3d2-460b-8ac5-b4797dd9d69f.jpg",
                       @"http://oneshow.img.nagezan.net/cd7cf0d0-8a8c-4c61-aeb1-54385cda9511.jpg",
                       @"http://oneshow.img.nagezan.net/00e5e18e-8ad6-4537-bcb2-057c87a8470f.png",
                       @"http://oneshow.img.nagezan.net/4d59709a-dc6a-4a9b-baf2-f0447f1dd2f5.jpg",
                       @"http://oneshow.img.nagezan.net/9ed9c475-cf53-454a-9c7a-88c7e2640477.png",
                       @"http://oneshow.img.nagezan.net/e1d4c94c-5a07-40f9-9408-8bd65f4d64fd.png",
                       @"http://oneshow.img.nagezan.net/7cb6f817-3ef9-4a43-ac03-a09b03a3830b.png",
                       @"http://oneshow.img.nagezan.net/d9f90a84-ab62-49cd-9f2d-b431ff52d8f2.png",
                       @"http://oneshow.img.nagezan.net/97fb68cd-e3c7-4cda-b64f-26047632cc76.png",
                       @"http://oneshow.img.nagezan.net/fbb8fd68-04f6-4a93-8463-b70b2a90be0c.png",
                       @"http://oneshow.img.nagezan.net/20e09288-0b45-40ed-b6de-0cc5600da2e8.jpg",
                       @"http://oneshow.img.nagezan.net/ed0482f7-2f5e-490f-b302-c9bb47d60de6.png",
                       @"http://wx.qlogo.cn/mmopen/v8LvcSSeusLSjIic2HUicRibQYq5gGomA1mm4Ahj0HiavicTfdEs6Buh4eQ1yckM9t3FfiaCt8rstK1XIJboBTLkM0Ma8Pcial34pnv/0",
                       @"http://oneshow.img.nagezan.net/9a6b18b9-b01d-4647-bc2a-2217c6ec92c9.jpg",
                       @"http://oneshow.img.nagezan.net/2dc8a8d9-dc00-425d-a94b-7575c12303ed.png",
                       @"http://oneshow.img.nagezan.net/21d11622-0651-4c24-a4df-9d3e2a7fe38f.jpg",
                       @"http://oneshow.img.nagezan.net/4d59709a-dc6a-4a9b-baf2-f0447f1dd2f5.jpg",
                       @"http://oneshow.img.nagezan.net/9ed9c475-cf53-454a-9c7a-88c7e2640477.png",
                       @"http://oneshow.img.nagezan.net/e1d4c94c-5a07-40f9-9408-8bd65f4d64fd.png",
                       @"http://oneshow.img.nagezan.net/7cb6f817-3ef9-4a43-ac03-a09b03a3830b.png",
                       @"http://oneshow.img.nagezan.net/d9f90a84-ab62-49cd-9f2d-b431ff52d8f2.png",
                       @"http://oneshow.img.nagezan.net/97fb68cd-e3c7-4cda-b64f-26047632cc76.png",
                       @"http://oneshow.img.nagezan.net/fbb8fd68-04f6-4a93-8463-b70b2a90be0c.png",
                       @"http://oneshow.img.nagezan.net/20e09288-0b45-40ed-b6de-0cc5600da2e8.jpg",
                       @"http://oneshow.img.nagezan.net/ed0482f7-2f5e-490f-b302-c9bb47d60de6.png",
                       @"http://wx.qlogo.cn/mmopen/v8LvcSSeusLSjIic2HUicRibQYq5gGomA1mm4Ahj0HiavicTfdEs6Buh4eQ1yckM9t3FfiaCt8rstK1XIJboBTLkM0Ma8Pcial34pnv/0",
                       @"http://oneshow.img.nagezan.net/9a6b18b9-b01d-4647-bc2a-2217c6ec92c9.jpg",
                       @"http://oneshow.img.nagezan.net/2dc8a8d9-dc00-425d-a94b-7575c12303ed.png",
                       @"http://oneshow.img.nagezan.net/21d11622-0651-4c24-a4df-9d3e2a7fe38f.jpg",@"http://oneshow.img.nagezan.net/4d59709a-dc6a-4a9b-baf2-f0447f1dd2f5.jpg",
                       @"http://oneshow.img.nagezan.net/9ed9c475-cf53-454a-9c7a-88c7e2640477.png",
                       @"http://oneshow.img.nagezan.net/e1d4c94c-5a07-40f9-9408-8bd65f4d64fd.png",
                       @"http://oneshow.img.nagezan.net/7cb6f817-3ef9-4a43-ac03-a09b03a3830b.png",
                       @"http://oneshow.img.nagezan.net/d9f90a84-ab62-49cd-9f2d-b431ff52d8f2.png",
                       @"http://oneshow.img.nagezan.net/97fb68cd-e3c7-4cda-b64f-26047632cc76.png",
                       @"http://oneshow.img.nagezan.net/fbb8fd68-04f6-4a93-8463-b70b2a90be0c.png",
                       @"http://oneshow.img.nagezan.net/20e09288-0b45-40ed-b6de-0cc5600da2e8.jpg",
                       @"http://oneshow.img.nagezan.net/ed0482f7-2f5e-490f-b302-c9bb47d60de6.png",
                       @"http://wx.qlogo.cn/mmopen/v8LvcSSeusLSjIic2HUicRibQYq5gGomA1mm4Ahj0HiavicTfdEs6Buh4eQ1yckM9t3FfiaCt8rstK1XIJboBTLkM0Ma8Pcial34pnv/0",
                       @"http://oneshow.img.nagezan.net/9a6b18b9-b01d-4647-bc2a-2217c6ec92c9.jpg",
                       @"http://oneshow.img.nagezan.net/2dc8a8d9-dc00-425d-a94b-7575c12303ed.png",
                       @"http://oneshow.img.nagezan.net/21d11622-0651-4c24-a4df-9d3e2a7fe38f.jpg"
                       ]];
     
    /*
    self.dataArray = [NSMutableArray arrayWithArray:
                      @[@"http://oneshow.img.nagezan.net/7f5e12dc-eaf2-4125-98cb-feafb7ba36ba.jpg",
                        @"http://oneshow.img.nagezan.net/78173537-9a7e-45d2-b61b-73cf1ba75723.png",
                        @"http://oneshow.img.nagezan.net/dd49ca2e-5007-40a0-8a29-9693620c8a50.jpg",
                        @"http://oneshow.img.nagezan.net/8a3d235a-d565-49ef-9b4d-5ecc60acb06d.jpg",
                        @"http://oneshow.img.nagezan.net/a29b9174-aab1-4fa6-a3a8-dfca24a5d3df.png",
                        @"http://oneshow.img.nagezan.net/782a436c-0a9a-4069-9da6-68883ceab02f.jpg",
                        @"http://oneshow.img.nagezan.net/03cc3ac2-3be1-4b9f-a799-003b3dc5926a.png"]];
     */
}

- (IBAction)showUITableView:(id)sender {
    NormalTableViewController *tbVC = [[NormalTableViewController alloc] init];
    tbVC.dataArray = _dataArray;
    [self.navigationController pushViewController:tbVC animated:YES];
}

- (IBAction)showASTableNode:(id)sender {
    ASDKTableViewController *tbVC = [[ASDKTableViewController alloc] init];
    tbVC.dataArray = _dataArray;
    [self.navigationController pushViewController:tbVC animated:YES];
}

- (IBAction)showUICollectionView:(id)sender {
    NormalCollectionViewController *colVC = [[NormalCollectionViewController alloc] init];
    colVC.dataArray = _dataArray;
    [self.navigationController pushViewController:colVC animated:YES];
}

- (IBAction)showASCollectionNode:(id)sender {
    ASDKCollectionViewController *colVC = [[ASDKCollectionViewController alloc] init];
    colVC.dataArray = _dataArray;
    [self.navigationController pushViewController:colVC animated:YES];
}


@end
