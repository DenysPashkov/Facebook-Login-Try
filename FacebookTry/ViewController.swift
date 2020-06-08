//
//  ViewController.swift
//  FacebookTry
//
//  Created by denys pashkov on 21/12/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {
    @IBOutlet weak var buttonForLogin: UIButton!
    @IBOutlet weak var nextPage: UIButton!
    
    var userID : String = ""
    var userToken : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let loginButton = FBLoginButton(frame: buttonForLogin.frame, permissions: ["read_insights","manage_pages","pages_show_list","public_profile"])
        self.view.addSubview(loginButton)
        loginButton.delegate = self
        if let accessToken = AccessToken.current {
//            user alredy logged
            userID = accessToken.userID
            userToken = accessToken.tokenString
            nextPage.isEnabled = true
            nextPage.isHidden = false

        }
    }
    
    @IBAction func changeView(_ sender: Any) {
        performSegue(withIdentifier: "PagesTableView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! PagesViewController
        nextView.userID = userID
        nextView.userToken = userToken
        nextPage.isEnabled = true
        nextPage.isHidden = false

    }
    
}

extension ViewController : LoginButtonDelegate{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let accessToken = AccessToken.current {
//            user alredy logged
            userID = accessToken.userID
            userToken = accessToken.tokenString
            nextPage.isEnabled = true
            nextPage.isHidden = false

        }
    }

    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        nextPage.isEnabled = false
        nextPage.isHidden = true

    }
    
}

