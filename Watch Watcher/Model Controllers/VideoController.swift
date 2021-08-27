//
//  VideoController.swift
//  Watch Watcher
//
//  Created by Ethan Andersen on 8/25/21.
//

import Foundation

class VideoController {
    
    static func getDownloadUrl(videoId: String, 🐶: @escaping ( Video ) -> Void) {
        let cleanVideoId = videoIdCleaner(videoId: videoId)
        guard let fetchUrl = URL(string:(StringConstants.snappeaGetDetailBase + cleanVideoId)) else { return }
        
        let task = URLSession.shared.dataTask(with: fetchUrl) { data, response , 🛑  in
            if let 🛑 = 🛑 {
                print("Error in \(#function)\(#line) : \(🛑.localizedDescription) \n---\n \(🛑)")
            }
            if let response = response {
                print("Error")
                print(response)
            }
            guard let data = data else { return }
            do {
                let title = try JSONDecoder().decode(TopLevel.self, from: data).videoInfo.title
                let finalUrl = URLFixer(videoId: videoId, rawTitle: title)
                
                🐶(Video(youTubeId: videoId, youTubeTitle: title, downloadUrl: finalUrl))
            } catch {
                print("Error")
            }
        }
        task.resume() // End of task
        
        
    } // End of Function
    
} // End of Class
