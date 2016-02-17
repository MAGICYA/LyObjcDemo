//
//  testImageViewControllerTable.m
//  LyObjcDemo
//
//  Created by wly1 on 15/11/17.
//
//

#import "testImageViewControllerTable.h"
#import "testImageCell.h"

@interface testImageViewControllerTable ()
@property (nonatomic,strong) NSArray *imgArr ;
@end

@implementation testImageViewControllerTable

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.frame];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    _imgArr = @[@"http://img2.mama100.com/site/mobile/share_image/201510/15168930_1446110288507_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/30577010_1441967088461_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/30577010_1441967090120_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/30670305_1446107674322_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/30670305_1446107532499_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/30670305_1446107533372_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/30698548_1446107413707_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/30698548_1446107425943_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/30698548_1446107426727_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/11467474_1446106706040_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12282006_1446106664996_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12282006_1446106666245_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12282006_1446106667701_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12282006_1446106669139_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12282006_1446106670679_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12282006_1446106672326_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/21281322_1446105552893_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/21281322_1446105553910_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/21281322_1446105554963_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/26595278_1446105183595_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/11392846_1446104947569_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/11392846_1446104948279_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27505147_1446104773631_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27505147_1446104774361_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27505147_1446104775103_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27505147_1446104775827_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/28420165_1446104434352_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/28420165_1446104435680_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/28420165_1446104436872_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/28420165_1446104437680_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/28420165_1446104439474_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13892290_1446104570040_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13892290_1446104571496_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13892290_1446104584162_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/5920577_1446104568442_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/16465078_1446104646967_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/16465078_1446104648983_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/16465078_1446104651089_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/16465078_1446104653066_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/16465078_1446104655231_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/16465078_1446104657276_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/25372592_1446103316549_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27173494_1446102317350_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27173494_1446102318704_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27173494_1446102319849_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27173494_1446102320861_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27173494_1446102321390_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27173494_1446102321836_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/19931704_1446101899737_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/19931704_1446101905053_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/25372592_1446101771719_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/5920577_1446101503146_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13650198_1446101371020_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13650198_1446101376140_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/20323773_1446100644725_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/20323773_1446100650120_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/20323773_1446100655401_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/20323773_1446100660758_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/20323773_1446100666070_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13948989_1446100672005_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12413991_1446100387641_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12413991_1446100388659_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12413991_1446100390088_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/12413991_1446100391219_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13182898_1446100015862_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13182898_1446100047757_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13182898_1446100060404_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/25548297_1446099234698_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/25548297_1446099235855_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/25548297_1446099237079_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/25548297_1446099238216_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098832920_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098838172_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098843412_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098848663_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098853912_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098859164_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/15170279_1446098687016_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098463982_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098469235_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098474475_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098479724_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098484966_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/27839879_1446098490245_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/16877250_1446097769290_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/16877250_1446097771046_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/18181230_1446097619052_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/18181230_1446097619770_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/18181230_1446097620317_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/18181230_1446097620834_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/5249370_1446096391979_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13650198_1446096301337_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/13650198_1446096306396_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/5046864_1446096440511_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/5046864_1446096442167_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/5046864_1446096443367_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/17916171_1446096045363_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/17916171_1446096046260_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/17916171_1446096047689_b.jpg",
                @"http://img2.mama100.com/site/mobile/share_image/201510/17916171_1446096048317_b.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    //初始化cell并指定其类型，也可自定义cell
    
    testImageCell *cell = (testImageCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[testImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
//    [cell setImageUrl:_imgArr[indexPath.row]];
    return cell;
}
@end
