//
//  FBApiRequest.swift
//  FacebookTry
//
//  Created by denys on 10/01/2020.
//  Copyright © 2020 denys pashkov. All rights reserved.
//

import Foundation
import UIKit

class FBApiRequest {
    
    func FBPages(id : String, user : String,completion:  @escaping (FBUserPages) -> ())  {
        
        let url = URL(string: "https://graph.facebook.com/v5.0/\(id)/accounts?fields=access_token,id,name&access_token=\(user)")

        let dataTask = URLSession.shared.dataTask(with: url!) { data,_,_ in
            
            guard let jsonData = data else {
                print("no data aviable")
                return
            }
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(FBUserPages.self, from: jsonData)
                completion(response)
                
            } catch{ print("can't process this shit") }
        }
        dataTask.resume()
    }
    
    func FBPageData(id:String,key:String,completion:  @escaping (PageResponse) -> ()){
        
        let url = URL(string: "https://graph.facebook.com/v5.0/\(id)/insights?access_token=\(key)&pretty=0&metric=page_fans,page_engaged_users,page_actions_post_reactions_like_total&period=day&fields=values%7Bvalue%7D&date_preset=today")
        
        let dataTask = URLSession.shared.dataTask(with: url!) { data,_,_ in
            
            guard let jsonData = data else {
                print("no data aviable")
                return
            }
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(PageResponse.self, from: jsonData)
                
                completion(response)
                
            } catch { print("can't process this shit") }
        }
        dataTask.resume()
        
    }
    
}
