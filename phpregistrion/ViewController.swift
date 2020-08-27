//
//  ViewController.swift
//  phpregistrion
//
//  Created by mac on 27/08/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    
    @IBOutlet weak var txtmob: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnclick(_ sender: Any) {
        
        let url = URL(string: "http://localhost/Fitness/empReg.php");
        var request  = URLRequest(url: url!);
        
        let strbody  = "emp_name=\(txtName.text!)&emp_email=\(txtemail.text!)&emp_mob=\(txtmob.text!)&emp_password=\(txtpassword.text!)";
        request.addValue(String(strbody.count), forHTTPHeaderField: "Content-Length");
        request.httpBody =  strbody.data(using: String.Encoding.utf8);
        request.httpMethod = "POST";
        let session  = URLSession.shared;
        let datatask  = session.dataTask(with: request) { (data1, resp, err) in
            
            do
            {
                
                let jsondata  = try JSONSerialization.jsonObject(with: data1!, options: []) as![Any];
                
                
                let dic = jsondata[0] as![String:Any];
                
                let status  = dic["status"] as! String;
                
                if status == "success"
                {
                    
                    print("done");
                    
                }
                else
                {
                    print("error");
                    
                    
                }
                
                
            }
            catch let err as NSError
            {
                print(err.description);
                
            }
            
            
            
            
        }
        
        datatask.resume();
        
        
        
    }
    

}

