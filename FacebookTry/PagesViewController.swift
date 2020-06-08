//
//  PagesViewController.swift
//  FacebookTry
//
//  Created by denys pashkov on 23/12/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import Foundation
import UIKit

class PagesViewController: UIViewController {
    
    var userID : String = ""
    var userToken : String = ""
    var pages : FBUserPages?
    
    @IBOutlet weak var pagesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readPagesApi()
        
    }
    
    func readPagesApi(){
        
        let FBrequest = FBApiRequest()
        FBrequest.FBPages(id: userID, user: userToken, completion: { response in
            
            DispatchQueue.main.async { // Correct
                self.pages = response
                self.pagesTableView.dataSource = self
                self.pagesTableView.delegate = self
                self.pagesTableView.reloadData()
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextView = segue.destination as! PageInformation
        let index = sender as! Int
        nextView.pageID = pages!.data![index].id
        nextView.pageKey = pages!.data![index].access_token
        
    }
    
}

extension PagesViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pages?.data?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PageCellController
        
        cell.pageName.text = pages?.data![indexPath.row].name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PageInformation", sender: indexPath.row)
    }
    
}
