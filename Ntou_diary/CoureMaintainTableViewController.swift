//
//  CoureMaintainTableViewController.swift
//  tableviewcrudtxt
//
//  Created by  ee1e on 2017/6/9.
//  Copyright © 2017年 Kinki Lai. All rights reserved.
//

import UIKit

class CoureMaintainTableViewController: UITableViewController {
    var coureSelect:[String:String]!
    var datePicker : UIDatePicker!
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem){
        let  notificationName = Notification.Name("maintainNotification")
        saveDate()
        if let text = nameTextField.text, text.isEmpty{
            self.sysAlertMsg(Opt:0,Msg:"日誌名稱不可為空白")
        }
       else if let text1 = startdateTextField.text,text1.isEmpty{
            self.sysAlertMsg(Opt:0,Msg:"日誌開始日期不可為空白")
        }
        else if let text2 = enddateTextField.text,text2.isEmpty{
            self.sysAlertMsg(Opt:0,Msg:"日誌結束日期不可為空白")
        }
        else if let text3 = descriptionTextView.text,text3.isEmpty{
            self.sysAlertMsg(Opt:0,Msg:"日誌內容不可為空白")
        }
        else
        {
        NotificationCenter.default.post(
            name: notificationName, object: nil, userInfo: coureSelect)
        
        self.navigationController?.popViewController(animated: true)
        }
    }
    func saveDate()
    {
        

        coureSelect = ["name":nameTextField.text!,
                       
                       "startdate":startdateTextField.text!,
                       "enddate":enddateTextField.text!,"pic":"1",
                       "description":descriptionTextView.text!,
                       "weblink":weblinkTextField.text!]
       
        
    }
    func sysAlertMsg(Opt:Int , Msg:String ){
        var alTitle:String
        
        switch(Opt){
        case 1:
            alTitle = "提示"
            break
        default:
            alTitle = "錯誤"
        }
        
        
        let alertController = UIAlertController(title: alTitle,
                                                message: Msg, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "確定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }

    
    
    
    @IBOutlet weak var enddateTextField: UITextField!
    @IBOutlet weak var startdateTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weblinkTextField: UITextField!

    @IBOutlet var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
   super.viewDidLoad()
        
        
        if coureSelect != nil {
            showData()
        }
     //print(coureSelect)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBAction func chooseDateAction(_ sender: UITextField) {
       self.pickUpDate(sender)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showData()
    {
        nameTextField.text=coureSelect["name"]
        startdateTextField.text=coureSelect["startdate"]
        enddateTextField.text=coureSelect["enddate"]
        weblinkTextField.text=coureSelect["weblink"]
        descriptionTextView.text=coureSelect["description"]
        
        
    }
    func pickUpDate(_ textField : UITextField){
        // DatePicker
        
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.datePickerMode = UIDatePickerMode.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        if textField.tag==1
        {
            if let text = startdateTextField.text, !text.isEmpty
            {
                datePicker.date=dateFormatter.date(from:startdateTextField.text!)!
                
            }
            
        }
        else
        {
            if let text = enddateTextField.text, !text.isEmpty
            {
                datePicker.date=dateFormatter.date(from:enddateTextField.text!)!
                
            }
        }
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CoureMaintainTableViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    func doneClick(_ textField : UITextField) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyy/MM/dd"
        if startdateTextField.isFirstResponder{
            startdateTextField.text = dateFormatter.string(from: datePicker.date)
            startdateTextField.resignFirstResponder()
        }else{
            enddateTextField.text = dateFormatter.string(from: datePicker.date)
            enddateTextField.resignFirstResponder()
        }
        
    }
    func cancelClick() {
        if startdateTextField.isFirstResponder{
            
            startdateTextField.resignFirstResponder()
        }else{
            
            enddateTextField.resignFirstResponder()
        }
    }    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
