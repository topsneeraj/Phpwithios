//
//  LoginViewController.swift
//  phpregistrion
//
//  Created by mac on 01/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtusername: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if checkLoginStatus() {
            
            let stb = self.storyboard?.instantiateViewController(identifier: "next");
            
            
            self.navigationController?.pushViewController(stb!, animated: false);
            
        }
        else{
            
            
            
            
        }

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    func checkLoginStatus() ->Bool {
        
        
        let fmg = FileManager();
        
        if fmg.fileExists(atPath: common.getPath()) {
            
            return true
        }
        else
        {
            return false
            
        }
        
        
    }
    
    
    @IBAction func btnclick(_ sender: Any) {
        
        let url = URL(string: "http://localhost/fitness/login.php?emp_email=\(txtusername.text!)&password=\(txtpassword.text!)");
        
        let request  = URLRequest(url: url!);
        let session  = URLSession.shared;
        
        let datatask  = session.dataTask(with: request) { (data1, resp, err) in
        
            
            
            let strresp  = String(data: data1!, encoding: String.Encoding.utf8);
            
            print(strresp);
            
            DispatchQueue.main.async {
               
                do
                {
                    
                    let jsondata  = try JSONSerialization.jsonObject(with: data1!, options: []) as![Any];
                    
                    if jsondata.count == 1
                    {
                        print("successfully ..");
                        
                        let dic  = jsondata[0] as! [String:Any];
                       common.createPlist(dic: dic);
                        
                        
                        
                    }
                    else
                    {
                        print("somthing went wrong");
                        
                    }
                    
                    
                }
                catch
                {
                    
                }
              
                
                
                
            }
            
            
            
        }
        
        
        datatask.resume();
        
        
        
        
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
