//
//  ViewController.swift
//  Watch Watcher
//
//  Created by Ethan Andersen on 8/6/21.
//

// MARK: - Video Properties
// Video codec: H.264 High Profile
// Bit rate: 160 kpbs at up to 30 fps
// 16:9 resolution: 320 x 180 in landscape orientation
// Audio bit rate: 32 kpbs stereo

import UIKit
import AVKit
import youtube_ios_player_helper

class ViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var youTubePlayer: YTPlayerView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        youTubePlayer.load(withVideoId: "z-9YlsON0u0")
    } // End of View Did load
    
    
    // MARK: - Local Video
    @IBAction func startLocalBtn(_ sender: Any) {
        let path = "/Users/Ethan/Desktop/Xcode Projects/Watch Watcher/video.mp4"
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        present(playerController, animated: true) {
            player.play()
        }
    } // End of Function

} // End of View Controller

