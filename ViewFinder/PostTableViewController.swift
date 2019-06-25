//
//  PostTableViewController.swift
//  ViewFinder
//
//  Created by Apple on 6/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    var photos : [Photos] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       
        }
        func getPhotos() {
    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

    if let coreDataPhotos = try?
context.fetch(Photos.fetchRequest()) as? [Photos] {
        
   photos = coreDataPhotos
    tableView.reloadData()

        
        }

        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
  
    // MARK: - Table view data source

   
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption
        if let cellPhotoImageData = cellPhoto.imageData {
            if let cellPhotoImage = UIImage(data: cellPhotoImageData)
        
            { cell.imageView?.image = cellPhotoImage
                
            }
        }

        return cell

}
}
