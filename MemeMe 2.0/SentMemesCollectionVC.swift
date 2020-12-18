//
//  SentMemesCollectionVC.swift
//  MemeMe 2.0
//
//  Created by Alexandre Bianchi on 13/12/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class SentMemesCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var memes: [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
        
    // MARK: - Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        collectionView.reloadData() // Reload data after view appears
        
        // Set the spacing for Collection View Cells
        let space: CGFloat = 3.0
        let dimensionX = (view.frame.size.width - (4 * space)) / 3.0
        let dimensionY = (view.frame.size.height - (5 * space)) / 4.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimensionX, height: dimensionY)
    }
    
    // MARK: - Collection View Methods

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesViewCell", for: indexPath) as! SentMemesViewCell
       cell.imageMeme?.image = memes[(indexPath as NSIndexPath).row].memedImage
       return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        controller.memedImage = memes[(indexPath as NSIndexPath).row].memedImage
        self.navigationController!.pushViewController(controller, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func addMemeAction(_ sender: Any) {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeVC") as! CreateMemeVC
        present(createMemeViewController, animated: true, completion: nil)
    }
    
}
