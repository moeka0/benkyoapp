//
//  nyuuryokuViewController.swift
//  benkyoapp
//
//  Created by Moeka on 2017/10/29.
//  Copyright © 2017年 Moeka. All rights reserved.
//

import UIKit

class nyuuryokuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var table : UITableView!
    @IBOutlet weak var gakkoutextField: UITextField!
    @IBOutlet weak var gakunenntextField: UITextField!
    var pickerView: UIPickerView = UIPickerView()
    var gakkoupickerView: UIPickerView = UIPickerView()
    var kyoukaArray = [String]()
    let gakkoulist = ["中学", "高校"]
    let gakunennlist = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 1
        pickerView.showsSelectionIndicator = true
        
        gakkoupickerView.delegate = self
        gakkoupickerView.dataSource = self
        gakkoupickerView.tag = 2
        gakkoupickerView.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(nyuuryokuViewController.done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(nyuuryokuViewController.cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)
        
        self.gakunenntextField.inputView = pickerView
        self.gakkoutextField.inputView = gakkoupickerView
        self.gakunenntextField.inputAccessoryView = toolbar
        self.gakkoutextField.inputAccessoryView = toolbar
        
        
        table.dataSource = self
        table.delegate = self
        
        table.allowsMultipleSelection = true
        
        table.tableFooterView = UIView(frame: .zero)
        
        self.view.addSubview(table)
        
        kyoukaArray = ["数学", "国語", "社会", "理科", "音楽", "美術", "家庭科", "技術"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kyoukaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにkyoukaArrayの各教科を表示する
        cell?.textLabel?.text = kyoukaArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
    }
    
    // セルの選択が外れた時に呼び出される
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        // チェックマークを外す
        cell?.accessoryType = .none
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return gakunennlist.count
        }else if gakkoupickerView.tag == 2{
            return gakkoulist.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return gakunennlist[row]
        }else if gakkoupickerView.tag == 2{
            return gakkoulist[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            self.gakunenntextField.text = gakunennlist[row]
        }else if gakkoupickerView.tag == 2{
            self.gakkoutextField.text = gakkoulist[row]
        }
    }
    
    @objc func cancel() {
        self.gakunenntextField.text = ""
        self.gakunenntextField.endEditing(true)
        
        self.gakkoutextField.text = ""
        self.gakkoutextField.endEditing(true)
    }
    
    @objc func done() {
        self.gakunenntextField.endEditing(true)
        self.gakkoutextField.endEditing(true)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
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
