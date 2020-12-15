//
//  SentMemesCollectionVC.swift
//  MemeMe 2.0
//
//  Created by Alexandre Bianchi on 13/12/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class SentMemesCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
   // @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
  //  override func viewDidLoad() {
  //      collectionView.dataSource = self
  //      collectionView.delegate = self
  //  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
        //collectionView!.reloadData()
        // If reloadData() is called in the viewWillAppear method of your collection view controller, the collection view will be refreshed every time the view appears.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView!.reloadData()
    }
    
    // MARK: Collection View Data Source

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesViewCell", for: indexPath) as! SentMemesViewCell
        
       // Set the name and image
       cell.imageMeme!.image = memes[(indexPath as NSIndexPath).row].memedImage
        
       return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
    //    let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentMemesCollectionsVC") as! SentMemesCollectionsVC
    //    detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
    //    self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
    
    
    @IBAction func addMemeAction(_ sender: Any) {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeVC") as! CreateMemeVC
        present(createMemeViewController, animated: true, completion: nil)
    }
    
}
