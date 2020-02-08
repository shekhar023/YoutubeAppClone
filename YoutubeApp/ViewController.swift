//
//  ViewController.swift
//  YoutubeApp
//
//  Created by Shekhar Chaudhary on 10/01/20.
//  Copyright © 2020 Shekhar Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, VideoModelDelegate {

    @IBOutlet weak var tableview: UITableView!
    var videos: [Video] = [Video]()
    var model:VideoModel = VideoModel()
    
    var selectedVideo : Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.model.delegate = self
        
        //MARK:Static VideoModel Call
       // self.videos = model.getVideos()
        
        //MARK:Fire off request to get videos
        model.getFeedVideos()
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }
    
    //MARK: - VideoModel Delegate Methods
    
    func dataReady() {
        
        // Access the video objects that have been downloaded
        self.videos = self.model.videoArray
        
        //Tell the tableview to reload
        self.tableview.reloadData()
        
    }
    
    //MARK: - TableView Delegates Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //Get the width of the screen to calculate the height of the row
        return self.view.frame.width
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        
        let videoTitle = videos[indexPath.row].videoTitle
        
        //Get Label for the cell
        let label = cell.viewWithTag(2) as! UILabel
        label.text = videoTitle
        
        //Construct Video Thumbnail URL
        let videoThumbnailUrlString = videos[indexPath.row].videoThumbnailURl
        
        //Create NSURL object
        let videoThumbnailUrl = URL(string: videoThumbnailUrlString)
        
        if videoThumbnailUrl != nil{
            
            //Create URL Request Object
            let request = URLRequest(url: videoThumbnailUrl!)
            
            //Create URL Session
            let session = URLSession.shared
            
            //Create Data Task and pass in the Request
            let dataTask = session.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    //Get a Reference to the image view element of the
                    let imageView = cell.viewWithTag(1) as! UIImageView
                                                     
                    //Create an image view object from data and assign it to the image view
                    imageView.image = UIImage(data: data!)
                })
                    
            }
            
            dataTask.resume()
               
        }
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Take a note which video user selected
        self.selectedVideo = self.videos[indexPath.row]
        
        //Call Segue
        self.performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Get a reference to the destination view controller
        let detailViewController = segue.destination as! VideoDetailViewController
        
        //Set the selected video property of the destination view controller
        detailViewController.selectedVideos = self.selectedVideo
        
    }

}

