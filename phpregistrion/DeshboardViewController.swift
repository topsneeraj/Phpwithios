//
//  DeshboardViewController.swift
//  phpregistrion
//
//  Created by mac on 01/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class DeshboardViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let name  = common.readPlist(key: "emp_name");
        lbl.text  = "Hello \(name)";
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutClick(_ sender: Any) {
        
        
        common.removePlistfile();
        
        
        self.navigationController?.popToRootViewController(animated: true);
        
        
        
        
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
