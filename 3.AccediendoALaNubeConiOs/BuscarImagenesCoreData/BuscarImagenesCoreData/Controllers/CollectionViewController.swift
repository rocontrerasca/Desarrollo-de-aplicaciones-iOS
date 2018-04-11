//
//  CollectionViewController.swift
//  BuscarImagenesCollectionView
//
//  Created by Developer 1 on 4/2/18.
//  Copyright © 2018 comDeveloper. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

struct Section {
    var name: String
    var images : [UIImage]
    
    init(name:String, images:[UIImage]) {
        self.name = name
        self.images = images
    }
}

class CollectionViewController: UICollectionViewController {
    
    var sections = [Section]()
    
    @IBAction func searchImage(_ sender: UITextField) {
        let section = Section(name: sender.text!, images: getImagesBySearch(tag: sender.text!))
        
        sections.append(section)
        
        //Refresh the view for the new search
        self.collectionView?.reloadData()
    }
    
    func getImagesBySearch(tag: String) -> [UIImage]{
        var images = [UIImage]()
        let urls = "https://api.flickr.com/services/feeds/photos_public.gne?tagmode=any&format=json&nojsoncallback=1&tags="
        let url = NSURL(string: urls + tag)
        let datos : NSData? = NSData(contentsOf: url! as URL)
        
        if (datos != nil) {
            let jsonResponse = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
            if (jsonResponse?.length)! <= 1 {
                let alert = UIAlertController(title: "Mensaje", message: "No se han encontrado resultados", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                do{
                    guard let json = try JSONSerialization.jsonObject(with: datos! as Data, options: [])
                        as? NSDictionary else {
                            print("error trying to convert data to JSON")
                            return images
                    }
                    let items = json["items"] as! NSArray
                    
                    for data in items {
                        let media = (data as! NSDictionary)["media"] as! NSDictionary
                        let imgLink = media["m"] as! NSString as String
                        
                        let url = NSURL(string: imgLink)
                        let imgData:NSData? = NSData(contentsOf: url! as URL)
                        if(imgData != nil){
                            if let image = UIImage(data:imgData! as Data){
                                images.append(image)
                            }
                        }
                    }
                }
                catch {}
            }
        } else {
            let alert = UIAlertController(title: "Mensaje", message: "No hay conexión a internet", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        return images
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.sections[section].images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Image
    
        // Configure the cell
        
        cell.img.image = sections[indexPath.section].images[indexPath.item]
        
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CellHeader", for: indexPath) as! Header
        
        header.lblHeader.text = sections[indexPath.section].name
        
        return header
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
