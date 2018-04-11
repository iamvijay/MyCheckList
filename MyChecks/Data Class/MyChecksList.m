//
//  MyChecksList.m
//  MyChecks
//
//  Created by Vijay on 10/04/18.
//  Copyright © 2018 sample. All rights reserved.
//

#import "MyChecksList.h"

@implementation MyChecksList

-(NSMutableArray*)productImageArray {
    if(!_productImageArray){
        _productImageArray = [[NSMutableArray alloc]initWithObjects:@"Hermes-logo.png",@"Philip_Plien_logo.jpg",@"LOccitane_Logo.jpg",@"kenzo-logo.jpg",@"Ray-Ban-logo.jpg", nil];
    }
    
    return _productImageArray;
}

-(NSMutableArray*)productNameArray {
    if(!_productNameArray){
        _productNameArray = [[NSMutableArray alloc]initWithObjects:@"Hermès",@"Philipp plein",@"L'Occitane",@"Kenzo",@"Ray Ban", nil];
    }
    
    return _productNameArray;
}

-(NSMutableArray*)productPriceArray {
    if(!_productPriceArray){
        _productPriceArray = [[NSMutableArray alloc]initWithObjects:@"$1,500.57",@"$978.67",@"$4600",@"$5,678",@"$2,880", nil];
    }
    
    return _productPriceArray;
}

-(NSMutableArray*)productDateArray {
    if(!_productDateArray){
        _productDateArray = [[NSMutableArray alloc]initWithObjects:@"28.04.2018",@"26.04.2018",@"25.04.2018",@"23.04.2018",@"23.04.2018", nil];
    }
    
    return _productDateArray;
}

-(NSMutableArray*)productStatusArray {
    if(!_productStatusArray){
        _productStatusArray = [[NSMutableArray alloc]initWithObjects:@"Complaint",@"Received",@"Correct",@"Not Received",@"Received", nil];
    }
    
    return _productStatusArray;
}

-(NSMutableArray*)productStatusImageArray {
    if(!_productStatusImageArray){
        _productStatusImageArray = [[NSMutableArray alloc]initWithObjects:@"Check_alert.png",@"Tick_blue.png",@"Tick_red.png",@"Stop_alert.png",@"Tick_blue.png", nil];
    }
    
    return _productStatusImageArray;
}

@end
