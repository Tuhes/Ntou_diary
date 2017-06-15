//
//  mapview.swift
//  tableviewcrudtxt
//
//  Created by  ee1e on 2017/6/9.
//  Copyright © 2017年 Kinki Lai. All rights reserved.
//



import UIKit
import MapKit
import SafariServices

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    func buttonPress(_ sender: UIButton) {
        if sender.tag == 100 {
            let url = URL(string: "http://www.ntou.edu.tw")
            let safari = SFSafariViewController(url: url!)
            show(safari, sender: self)
        }
    }
    ////
    func buttonPress1(_ sender: UIButton) {
        if sender.tag == 100 {
            let url = URL(string: "http://www.klcg.gov.tw/")
            let safari = SFSafariViewController(url: url!)
            show(safari, sender: self)
        }
    }
    /////
    func buttonPress2(_ sender: UIButton) {
        if sender.tag == 100 {
            let url = URL(string: "http://www.nmmst.gov.tw/chhtml/")
            let safari = SFSafariViewController(url: url!)
            show(safari, sender: self)
        }
    }
    ////
    func buttonPress3(_ sender: UIButton) {
        if sender.tag == 100 {
            let url = URL(string: "http://kl.twport.com.tw/chinese/")
            let safari = SFSafariViewController(url: url!)
            show(safari, sender: self)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: 25.150339, longitude: 121.775844)
        ann.title = "國立臺灣海洋大學"
        mapView.addAnnotation(ann)
        ///
        let ann1 = MKPointAnnotation()
        ann1.coordinate = CLLocationCoordinate2D(latitude: 25.131095, longitude: 121.744542)
        ann1.title = "基隆市政府"
        mapView.addAnnotation(ann1)
        ///
        let ann2 = MKPointAnnotation()
        ann2.coordinate = CLLocationCoordinate2D(latitude:25.140701, longitude: 121.797609)
        ann2.title = "國立海洋科技博物館"
        mapView.addAnnotation(ann2)
        ///
        let ann3 = MKPointAnnotation()
        ann3.coordinate = CLLocationCoordinate2D(latitude:25.131609, longitude: 121.741583)
        ann3.title = "基隆港"
        mapView.addAnnotation(ann3)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        if (annView == nil) {
            annView = MKPinAnnotationView(annotation: annotation, reuseIdentifier:
                "Pin")
        }
        
        if (annotation.title)! == "國立臺灣海洋大學"{
           
            let imageView = UIImageView(image: UIImage(named: "Icon-60"))
            annView?.leftCalloutAccessoryView = imageView
            
         
            let label = UILabel()
            label.numberOfLines = 2
            label.text = "緯度:\(annotation.coordinate.latitude)\n經度:\(annotation.coordinate.longitude)"
            annView?.detailCalloutAccessoryView = label
            
            let button = UIButton(type: .detailDisclosure)
            button.tag = 100
            button.addTarget(self, action: #selector(buttonPress), for:.touchUpInside)
               annView?.rightCalloutAccessoryView = button
         
            
        }
        /////////////////////
      else  if (annotation.title)! == "基隆市政府"{
           
            let imageView = UIImageView(image: UIImage(named: "Icon-64"))
            annView?.leftCalloutAccessoryView = imageView
            
        
            let label = UILabel()
            label.numberOfLines = 2
            label.text = "緯度:\(annotation.coordinate.latitude)\n經度:\(annotation.coordinate.longitude)"
            annView?.detailCalloutAccessoryView = label
            
        
            
            
            let button = UIButton(type: .detailDisclosure)
            button.tag = 100
            button.addTarget(self, action: #selector(buttonPress1), for:.touchUpInside)
            annView?.rightCalloutAccessoryView = button
        }
        else  if (annotation.title)! == "國立海洋科技博物館"{
          
            let imageView = UIImageView(image: UIImage(named: "Icon-62"))
            annView?.leftCalloutAccessoryView = imageView
            
          
            let label = UILabel()
            label.numberOfLines = 2
            label.text = "緯度:\(annotation.coordinate.latitude)\n經度:\(annotation.coordinate.longitude)"
            annView?.detailCalloutAccessoryView = label
            
           
            
            
            let button = UIButton(type: .detailDisclosure)
            button.tag = 100
            button.addTarget(self, action: #selector(buttonPress2), for:.touchUpInside)
            annView?.rightCalloutAccessoryView = button
            
            
        }
        else  if (annotation.title)! == "基隆港"{
         
            let imageView = UIImageView(image: UIImage(named: "Icon-61"))
            annView?.leftCalloutAccessoryView = imageView
            
           
            let label = UILabel()
            label.numberOfLines = 2
            label.text = "緯度:\(annotation.coordinate.latitude)\n經度:\(annotation.coordinate.longitude)"
            annView?.detailCalloutAccessoryView = label
            
       
            
            
            let button = UIButton(type: .detailDisclosure)
            button.tag = 100
            button.addTarget(self, action: #selector(buttonPress3), for:.touchUpInside)
            annView?.rightCalloutAccessoryView = button
            
            
        }


        annView?.canShowCallout = true
        
        return annView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




    


