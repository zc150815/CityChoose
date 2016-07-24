//
//  ViewController.m
//  城市选择
//
//  Created by Ning Xie on 16/5/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "ZCCityModel.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) NSArray *appList;

@property(assign, nonatomic) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//数据源方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.appList.count;
    }
    else
    {
//        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        ZCCityModel *model = self.appList[self.index];
        
        NSArray *array = model.cities;
        return array.count;
    }
}

//代理方法
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        ZCCityModel *model = self.appList[row];
        return [model name];
    }
    else
    {
//        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        ZCCityModel *model = self.appList[self.index];
        return model.cities[row];
    }
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        self.index = row;
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

//懒加载数据
-(NSArray *)appList
{
    if (_appList == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array)
        {
            ZCCityModel *model = [ZCCityModel cityWithDict:dict];
            
            [arrayM addObject:model];
        }
        _appList = arrayM.copy;
    }
    return _appList;
}

@end
