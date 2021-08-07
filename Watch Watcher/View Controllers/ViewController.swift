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

class ViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Actions
    @IBAction func startBtn(_ sender: Any) {
        playVideo()
    }
    
    
    func playVideo() {
        let path = "/Users/Ethan/Desktop/Xcode Projects/Watch Watcher/video.mp4"
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        present(playerController, animated: true) {
            player.play()
        }
    } // End of Function

} // End of View Controller

