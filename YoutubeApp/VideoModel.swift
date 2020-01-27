//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by Shekhar Chaudhary on 10/01/20.
//  Copyright © 2020 Shekhar Chaudhary. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    
    func getFeetVideos(){
        
        //Fetch videos Dynamically through Youtube Data API
        
    }

    func getVideos() -> [Video] {
        
        //Create an empty array of Video objects
        var videos = [Video]()
        
        // Create Video Object
        let video1 = Video()
        
        // Assign Properties
        video1.videoID = "1t81oNoUtUw&list=PLI-zMUS3OMwqURvlS8_qPFUp5jNxhFQpT&index=3&t=55s"
        video1.videoTitle = "Let's Play Uncharted™ 4 A Thief’s End King of the Hill Match"
        video1.videoDescription = "Let's Play Uncharted™ 4  A Thief’s End  Multiplayer"
        
        // Append it into videos array
        videos.append(video1)
        
        // Create Video Object
        let video2 = Video()
        
        // Assign Properties
        video2.videoID = "YP4HlPmWPbY"
        video2.videoTitle = "Ghost of Tsushima-PS4-TGA 2019 Full Trailer"
        video2.videoDescription = "The year is 1274. Samurai warriors are the legendary defenders of Japan--until the fearsome Mongol Empire invades the island of Tsushima, wreaking havoc and conquering the local "
        
        // Append it into videos array
        videos.append(video2)
        
        // Create Video Object
        let video3 = Video()
        
        // Assign Properties
        video3.videoID = "p2cEOlEpIkg"
        video3.videoTitle = "Tom Clancy's Division 2 Open World Gameplay"
        video3.videoDescription = "Tom Clancy's Division 2"
        
        // Append it into videos array
        videos.append(video3)
        
        // Create Video Object
        let video4 = Video()
        
        // Assign Properties
        video4.videoID = "pFNmfNtiTkU"
        video4.videoTitle = "Devil May Cry 5 Walkthrough"
        video4.videoDescription = "My Devil May Cry 5 Gameplay Walkthrough will feature the Full Game Story Campaign for Nero, Dante and V."
        
        // Append it into videos array
        videos.append(video4)
        
        // Create Video Object
        let video5 = Video()
        
        // Assign Properties
        video5.videoID = "StnIebzB9oE"
        video5.videoTitle = "RESIDENT EVIL 2 REMAKE CLAIRE WALKTHROUGH"
        video5.videoDescription = "its my first time playing RE2 and never played the orignal before,hope you like it. Please like,comment,share and subscribe."
        
        // Append it into videos array
        videos.append(video4)
        
        
        // Return the array to the caller
        return videos
    }
}
