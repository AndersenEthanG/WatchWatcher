//
//  InterfaceController.swift
//  Watch Watcher WatchKit Extension
//
//  Created by Ethan Andersen on 8/6/21.
//

import WatchKit
import Foundation

// MARK: - Video Properties
// Video codec: H.264 High Profile
// Bit rate: 160 kpbs at up to 30 fps
// 16:9 resolution: 320 x 180 in landscape orientation
// Audio bit rate: 32 kpbs stereo


class InterfaceController: WKInterfaceController {

    // MARK: - Properties
    let videoURL: URL = URL(fileURLWithPath: "")
    
    
    // MARK: - Outlets
    @IBOutlet weak var videoPlayer: WKInterfaceMovie!
    
    
    // MARK: - Lifecycle
    override func awake(withContext context: Any?) {
        loadVideoData()
    }

    
    // MARK: - Functions
    func loadVideoData() {
        
    }
    
} // End of Class
