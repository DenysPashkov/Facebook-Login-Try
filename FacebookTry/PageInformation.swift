//
//  PageInformation.swift
//  FacebookTry
//
//  Created by denys pashkov on 23/12/2019.
//  Copyright © 2019 denys pashkov. All rights reserved.
//

import Foundation
import UIKit

class PageInformation: UIViewController {
    
    var pageID : String = ""
    var pageKey : String = ""
    var FBelements : [Dati] = []
    @IBOutlet weak var numberOfLike: UILabel!
    @IBOutlet weak var FBcollectionView: UICollectionView!
    @IBOutlet weak var FBengagedPeople: UILabel!
    @IBOutlet weak var FBimpressionsPoint: UILabel!
    @IBOutlet weak var FBnegativeFeed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readPagesApi()
    }
    
    func readPagesApi(){
        
        let FBRequest = FBApiRequest()
        FBRequest.FBPageData(id: pageID, key: pageKey, completion: {response in
            
            DispatchQueue.main.async { // Correct
                self.numberOfLike.text = "This page have: \(response.data[0].values[0].value) Like"
                self.FBelements = response.data
                self.FBengagedPeople.text = "Today you engaged \(response.data[7].values[0].value) people"
                self.FBimpressionsPoint.text = "Today you impressed \(response.data[8].values[0].value) people"
                self.FBnegativeFeed.text = "Today you got negative feedback from \(response.data[9].values[0].value) people"
                self.FBcollectionView.delegate = self
                self.FBcollectionView.dataSource = self
            }
        })
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        
        self.dismiss(animated: false)
        
    }
}

extension PageInformation : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CellCollectionView
         
        cell.representativeImage.image = UIImage(named: "image\(indexPath.row)")
        cell.representativeValue.text = " \(FBelements[indexPath.row + 1].values[0].value)"
        
        return cell
        
    }
}
