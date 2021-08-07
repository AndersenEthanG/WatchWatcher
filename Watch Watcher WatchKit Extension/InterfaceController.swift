//
//  InterfaceController.swift
//  Watch Watcher WatchKit Extension
//
//  Created by Ethan Andersen on 8/6/21.
//

import WatchKit
import UIKit
import AVFoundation
import AVKit

// MARK: - Video Properties
// Video codec: H.264 High Profile
// Bit rate: 160 kpbs at up to 30 fps
// 16:9 resolution: 320 x 180 in landscape orientation
// Audio bit rate: 32 kpbs stereo


class InterfaceController: WKInterfaceController {

    // MARK: - Actions
    @IBAction func startBtn() {
        let path = URL(fileURLWithPath: "/Users/Ethan/Desktop/Xcode Projects/Watch Watcher/video.mp4")
        let options = [WKMediaPlayerControllerOptionsAutoplayKey: true]
        
        presentMediaPlayerController(with: path, options: options) { (didPlayToEnd, endTime, error) -> Void in
            print("Video finished")
        }
    } // End of Function
    
} // End of Class
