//
//  ViewController.swift
//  collectionview
//
//  Created by Syed.Reshma Ruksana on 2/13/20.
//  Copyright © 2020 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var flowLayout = UICollectionViewFlowLayout()
    
    
    var namesArray = ["Mahesh","Aditya","Varun","Sid","Karthik","Salman"]
    var imagesArray = [#imageLiteral(resourceName: "img5"),#imageLiteral(resourceName: "img3"),#imageLiteral(resourceName: "img2"),#imageLiteral(resourceName: "img4"),#imageLiteral(resourceName: "img6"),#imageLiteral(resourceName: "img1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "abc")
        tableView.delegate = self
        tableView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "xyz")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        flowLayout.minimumLineSpacing = 15
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal
        // Do any additional setup after loading the view.
    }

  func images()
   {
    imageView = UIImageView(image: UIImage(named: "img1"))
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
       {
        var cell =  tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        
        cell.textLabel?.text = namesArray[indexPath.row]
        
        cell.imageView?.image = imagesArray[indexPath.row]
        return cell
       }
    
     func numberOfSections(in tableView: UITableView) -> Int
     {
        return 3
     }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0)
        {
             return "ACTORS"
        }
        
       if(section == 1) {
            return "ACTRESS"
        }
       else{
        return "DIRECTORS"
        }
    }
    
   
    // COLLECTION VIEW PROCESS
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 60, height: 60)
    }
    
  func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 1.0
     }
    
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return namesArray.count
      }
      
    
    
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
        
        var item = collectionView.dequeueReusableCell(withReuseIdentifier: "xyz", for: indexPath)
        

         var images = UIImageView(image: imagesArray[indexPath.item])
         images.frame = CGRect(x: 0, y: 0, width:60, height: 60)
        
        item.contentView.addSubview(images)
              
        return item
              
        
       
       
      }
}

