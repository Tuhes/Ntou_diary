//
//  MapSecondViewcontroller.swift
//  Ntou_diary
//
//  Created by user_23 on 2017/6/14.
//  Copyright © 2017年 Kinki Lai. All rights reserved.
//

import UIKit
import MapKit

class MapSecondViewcontroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        let myloation = CLLocationCoordinate2D(latitude: 25.15033965356557, longitude: 121.77584454417229)
        let airstation = CLLocationCoordinate2D(latitude: 25.140700413850272, longitude: 121.79760932922363)
      
        
        let pA = MKPlacemark(coordinate: myloation, addressDictionary: nil)
        let pB = MKPlacemark(coordinate: airstation, addressDictionary: nil)
       
        
        let miA = MKMapItem(placemark: pA)
        let miB = MKMapItem(placemark: pB)
      
        miA.name = "我的位置"
        miB.name = "國立海洋科技博物館"
        
        
        let routes = [miA, miB]
        
        let options = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving]

        MKMapItem.openMaps(with: routes, launchOptions: options)
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
