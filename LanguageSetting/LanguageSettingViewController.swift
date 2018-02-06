//
//  LanguageSettingViewController.swift
//  LanguageSetting
//
//  Created by Lullaby on 6/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import UIKit

class LanguageSettingViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var languageTableView: UITableView!
    
    let allLanguages = ["English", "ภาษาไทย", "中文", "日本語"]
    var selectedLanguage = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Comfirmation", message: "Are you sure you want to cancel the setting?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
            self.navigationController?.popViewController(animated: true)
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Comfirmation", message: "Would you like to change your languagu to be \((selectedLanguage))?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LanguageSettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        let cell:LanguageTableViewCell = self.languageTableView.dequeueReusableCell(withIdentifier: "TableCell") as! LanguageTableViewCell
        
        cell.languaguLabel.text = allLanguages[indexPath.row]
        
        //set BackgroundView for the selected cell
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.languageTableView.cellForRow(at: indexPath) as! LanguageTableViewCell
        cell.checkBoxImage.image = #imageLiteral(resourceName: "checkbox-check")
        
        selectedLanguage = cell.languaguLabel.text!
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = self.languageTableView.cellForRow(at: indexPath) as! LanguageTableViewCell
        cell.checkBoxImage.image = #imageLiteral(resourceName: "checkbox-blank")
    }
    
}

