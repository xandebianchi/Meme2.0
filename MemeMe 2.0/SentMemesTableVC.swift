//
//  SentMemesTableVC.swift
//  MemeMe 2.0
//
//  Created by Alexandre Bianchi on 30/11/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class SentMemesTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memes: [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let controller = self.storyboard!.instantiateViewController(withIdentifier: "StoryNodeViewController") as! StoryNodeViewController
//        controller.storyNode = nextStoryNode
//        self.navigationController!.pushViewController(controller, animated: true)
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.preferredContentSizeDidChange(forChildContentContainer: UIContentContainer)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of prompts in the storyNode (The 2 is just a place holder)
        return memes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Dequeue a cell and populate it with text from the correct prompt.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        cell.textLabel!.text = memes[(indexPath as NSIndexPath).row].topText
        return cell
    }
    
    @IBAction func addMemeAction(_ sender: Any) {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "CreateMemeVC") as! CreateMemeVC
        present(createMemeViewController, animated: true, completion: nil)
    }
    
}
