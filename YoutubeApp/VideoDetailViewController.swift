//
//  VideoDetailViewController.swift
//  YoutubeApp
//
//  Created by Shekhar Chaudhary on 14/01/20.
//  Copyright © 2020 Shekhar Chaudhary. All rights reserved.
//

import UIKit
import WebKit

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var webViewHeightConstrant: NSLayoutConstraint!
    
    
    var selectedVideos : Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {

        if let vid = self.selectedVideos{
          
          self.titleLabel.text = vid.videoTitle
          self.descriptionLabel.text = vid.videoDescription
          
            let width = self.view.frame.size.width
          
            let height = width/320*180
            
            let w = width.description
            
            let h = height.description
            
            let s = "<html><head><style type=\"text/css\">body"
            
            let s1 = "{background-color: transparent;color:"
            
            let s2 = "white;}</style></head><body style=\"margin:0\">"
            
            let s3 = "<iframe frameBorder=\"0\" height=\"" + (h) + "\""
            
            let s4 = " width=\"" + (w) + "\" src=\"http://www.youtube.com/"
            
            let s5 = "embed/" + vid.videoId + "?showinfo=0&modestbranding=1&"
            
            let s6 = "frameborder=0&rel=0\"></iframe></body></html>"
        
            let videoEmbedString = String(s + s1 + s2 + s3 + s4 + s5 + s6)
          
          
            self.webView.loadHTMLString(videoEmbedString, baseURL: nil)
            
        }
    }
}
