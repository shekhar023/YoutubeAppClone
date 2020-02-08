//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by Shekhar Chaudhary on 10/01/20.
//  Copyright © 2020 Shekhar Chaudhary. All rights reserved.
//

import UIKit
import Alamofire

protocol VideoModelDelegate {
    func dataReady()
}

class VideoModel: NSObject {
    
    let API_KEY = "AIzaSyAxQmM8s8XLktIqQ7rnP9PwnwlzbPlKMd4"
    let UPLOAD_PLAYLIST_ID = "PLI-zMUS3OMwpBkAmYWRQ099s135zh91CC"
    
    var videoArray = [Video]()
    
    var delegate: VideoModelDelegate?
    
    func getFeedVideos(){
        
        //MARK:Fetch videos Dynamically through Youtube Data API
        Alamofire.request("https://www.googleapis.com/youtube/v3/playlistItems", method: .get, parameters: ["part":"snippet", "playlistId":UPLOAD_PLAYLIST_ID, "key":API_KEY], encoding: Alamofire.URLEncoding.default, headers: nil).responseJSON { response in
            
            if let status = response.response?.statusCode {
                         switch(status){
                         case 200:
                             print("example success")
                         default:
                             print("error with response status: \(status)")
                         }
                     }
            
                     //MARK:to get JSON return value
                     if let JSON = response.result.value {
                        
                        var arrayOfVideos = [Video]()
                        
                        for video in (JSON as! NSDictionary)["items"] as! NSArray{
                         print(video)
                            
                            //MARK:Create video objects off of the JSON response
                            let videoObj = Video()
                            videoObj.videoId = (video as AnyObject).value(forKeyPath: "snippet.resourceId.videoId") as! String
                            
                            videoObj.videoTitle = (video as AnyObject).value(forKeyPath: "snippet.title") as! String
                            
                            videoObj.videoDescription = (video as AnyObject).value(forKeyPath: "snippet.description") as! String
                            
                            videoObj.videoThumbnailURl = (video as AnyObject).value(forKeyPath: "snippet.thumbnails.maxres.url") as! String
                            
                            arrayOfVideos.append(videoObj)
                     }
                        //When all the video objects have been constructed, assign the array to the VideoModel Property
                        self.videoArray = arrayOfVideos
                        
                        //Notify the delegate that the data is ready
                        if self.delegate != nil{
                            self.delegate!.dataReady()
                        }
            }
         }
    }
    
/* Static Parsing*/
    /*
    func getVideos() -> [Video] {
        
        //Create an empty array of Video objects
        var videos = [Video]()
        
        // Create Video Object
        let video1 = Video()
        
        // Assign Properties
        video1.videoId = "1t81oNoUtUw&list=PLI-zMUS3OMwqURvlS8_qPFUp5jNxhFQpT&index=3&t=55s"
        video1.videoTitle = "Let's Play Uncharted™ 4 A Thief’s End King of the Hill Match"
        video1.videoDescription = "Let's Play Uncharted™ 4  A Thief’s End  Multiplayer"
        
        // Append it into videos array
        videos.append(video1)
        
        // Create Video Object
        let video2 = Video()
        
        // Assign Properties
        video2.videoId = "YP4HlPmWPbY"
        video2.videoTitle = "Ghost of Tsushima-PS4-TGA 2019 Full Trailer"
        video2.videoDescription = "The year is 1274. Samurai warriors are the legendary defenders of Japan--until the fearsome Mongol Empire invades the island of Tsushima, wreaking havoc and conquering the local "
        
        // Append it into videos array
        videos.append(video2)
        
        // Create Video Object
        let video3 = Video()
        
        // Assign Properties
        video3.videoId = "p2cEOlEpIkg"
        video3.videoTitle = "Tom Clancy's Division 2 Open World Gameplay"
        video3.videoDescription = "Tom Clancy's Division 2"
        
        // Append it into videos array
        videos.append(video3)
        
        // Create Video Object
        let video4 = Video()
        
        // Assign Properties
        video4.videoId = "pFNmfNtiTkU"
        video4.videoTitle = "Devil May Cry 5 Walkthrough"
        video4.videoDescription = "My Devil May Cry 5 Gameplay Walkthrough will feature the Full Game Story Campaign for Nero, Dante and V."
        
        // Append it into videos array
        videos.append(video4)
        
        // Create Video Object
        let video5 = Video()
        
        // Assign Properties
        video5.videoId = "StnIebzB9oE"
        video5.videoTitle = "RESIDENT EVIL 2 REMAKE CLAIRE WALKTHROUGH"
        video5.videoDescription = "its my first time playing RE2 and never played the orignal before,hope you like it. Please like,comment,share and subscribe."
        
        // Append it into videos array
        videos.append(video4)
        
        
        // Return the array to the caller
        return videos
    }
 */

}
