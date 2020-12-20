//
//  SentMemesTableVC.swift
//  MemeMe 2.0
//
//  Created by Alexandre Bianchi on 30/11/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var memes: [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    // MARK: - Life Cycle
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData() // Reload data after view appears
    }
    
    // MARK: - Table View Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        controller.memedImage = memes[(indexPath as NSIndexPath).row].memedImage
        self.navigationController!.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of prompts in the storyNode (The 2 is just a place holder)
        return memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Dequeue a cell and populate it with text from the correct prompt.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        cell.imageView!.image = memes[(indexPath as NSIndexPath).row].memedImage
        cell.textLabel!.text = memes[(indexPath as NSIndexPath).row].topText + "..." + memes[(indexPath as NSIndexPath).row].bottomText
        return cell
    }
    
    // MARK: - Actions
    
    @IBAction func addMemeAction(_ sender: Any) {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeVC") as! CreateMemeViewController
        present(createMemeViewController, animated: true, completion: nil)
    }
    
}
