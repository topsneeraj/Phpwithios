//
//  common.swift
//  phpregistrion
//
//  Created by mac on 01/09/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class common {
    
    
    
 static   func readPlist(key:String) -> String {
        
        let fmg = FileManager();
        
        if fmg.fileExists(atPath: getPath()) {
            
            
            let dic  = NSDictionary(contentsOfFile: getPath());
            
            
            var value  = dic?.value(forKey: key);
            
            return (value as? String)!;
            
            
        }
        else
        {
            return "";
            
        }
        
    }
    
  static  func removePlistfile()  {
        
        let file = FileManager();
        
        if file.fileExists(atPath: getPath()) {
            
            do {
                try   file.removeItem(atPath: getPath());
                
            } catch  {
                
            }
          
            
        }
        
        
    }
    

   static func getPath() -> String {
           
           let strpath  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
                  
                  let path  = strpath[0];
                  let finalpath  = path.appending("/profile.plist");
                  
           
           return finalpath;
           
       }
       
   static    func createPlist(dic:[String:Any]) {
           
           
           
           let dic  = NSDictionary(dictionary: dic);
       
           dic.write(toFile: getPath(), atomically: true);
           
           
           
           
           
       }
       
    
    

}
