//
//  ViewController.swift
//  tableviewcrudtxt
//
//  Created by  ee1e on 2017/6/9.
//  Copyright © 2017年 Kinki Lai. All rights reserved.
//

import UIKit
import CoreImage
class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITableViewDataSource {
    
    var photoArray: [String] = []
    
    @IBOutlet weak var photoTableView: UITableView!
    var img: UIImage?
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
  
    @IBAction func getAlbum(_ sender: Any) {
   
        let imagePicker = UIImagePickerController()
   
        imagePicker.sourceType = .photoLibrary
     
        imagePicker.delegate = self
     
        self.present(imagePicker, animated: true, completion: nil)
    }
    
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        img = image
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let interval = Date.timeIntervalSinceReferenceDate
        let name = "\(interval).jpg"
        
        let url = docUrl?.appendingPathComponent(name)
        let data = UIImageJPEGRepresentation(image, 0.9)
        try! data?.write(to: url!)
        
        self.dismiss(animated:true, completion: nil)
        
    
        photoArray.append(name)
        saveFile()
        
     
        photoTableView.reloadData()
    }
    
    
   
    func saveFile(){
        let fileManager = FileManager.default
        
        let docUrls = fileManager.urls(for: .documentDirectory, in:
            .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("photoArray.txt")
        let array = photoArray
        (array as NSArray).write(to: url!, atomically: true)
    }
    
   
    func loadFile(){
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in:
            .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("photoArray.txt")
        
        if let array = NSArray(contentsOf: url!){
            photoArray = array as! [String]
        }
     
        photoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        let cells = ceil(Double(photoArray.count)/3)
        return Int(cells)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "showPhotos", for: indexPath)
        let imageView1 = cell.contentView.viewWithTag(1) as! UIImageView
        let imageView2 = cell.contentView.viewWithTag(2) as! UIImageView
        let imageView3 = cell.contentView.viewWithTag(3) as! UIImageView
        
     
        let photoIndex1 = ((indexPath.row + 1) * 3) - 3
        let photoIndex2 = ((indexPath.row + 1) * 3) - 2
        let photoIndex3 = ((indexPath.row + 1) * 3) - 1
        
       
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        
        
        if indexPath.row + 1 == Int(ceil(Double(photoArray.count)/3)){
            let url1 = docUrl?.appendingPathComponent(photoArray[photoIndex1])
            imageView1.image = UIImage(contentsOfFile: (url1?.path)!)
            
            if (photoArray.count) % 3 == 0 || (photoArray.count) % 3 == 2 {
                let url2 = docUrl?.appendingPathComponent(photoArray[photoIndex2])
                imageView2.image = UIImage(contentsOfFile: (url2?.path)!)
            }
            
            if (photoArray.count) % 3 == 0 {
                let url3 = docUrl?.appendingPathComponent(photoArray[photoIndex3])
                imageView3.image = UIImage(contentsOfFile: (url3?.path)!)
            }
        }else{
            let url1 = docUrl?.appendingPathComponent(photoArray[photoIndex1])
            imageView1.image = UIImage(contentsOfFile: (url1?.path)!)
            
            let url2 = docUrl?.appendingPathComponent(photoArray[photoIndex2])
            imageView2.image = UIImage(contentsOfFile: (url2?.path)!)
            
            let url3 = docUrl?.appendingPathComponent(photoArray[photoIndex3])
            imageView3.image = UIImage(contentsOfFile: (url3?.path)!)
        }
        
        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        loadFile()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    
    
}
