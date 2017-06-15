//
//  MapSecondView.swift
//  tableviewcrudtxt
//
//  Created by  ee1e on 2017/6/11.
//  Copyright © 2017年 Kinki Lai. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapSecondView: UIViewController {
    
    var mainMapView: MKMapView!
    
    //定位管理器
    let locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使用代码创建
        self.mainMapView = MKMapView(frame:self.view.frame)
        self.view.addSubview(self.mainMapView)
        
        //地图类型设置 - 标准地图
        self.mainMapView.mapType = MKMapType.standard
        
        //创建一个MKCoordinateSpan对象，设置地图的范围（越小越精确）
        let latDelta = 0.05
        let longDelta = 0.05
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        //定义地图区域和中心坐标（
        //使用当前位置
        //var center:CLLocation = locationManager.location.coordinate
        //使用自定义位置
        let center:CLLocation = CLLocation(latitude: 25.137799899999997 , longitude: 121.78768190000001)
        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate,
                                                                  span: currentLocationSpan)
        
        //设置显示区域
        self.mainMapView.setRegion(currentRegion, animated: true)
        
        //创建一个大头针对象
        let objectAnnotation = MKPointAnnotation()
        //设置大头针的显示位置
        objectAnnotation.coordinate = CLLocation(latitude: 25.144138577615358,
                                                 longitude: 121.80338144302368).coordinate
        //设置点击大头针之后显示的标题
        objectAnnotation.title = "潮境公園"
        //设置点击大头针之后显示的描述
        objectAnnotation.subtitle = "安安"
        //添加大头针
        self.mainMapView.addAnnotation(objectAnnotation)
}
}
