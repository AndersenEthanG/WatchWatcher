//
//  InterfaceController.swift
//  Watch Watcher WatchKit Extension
//
//  Created by Ethan Andersen on 8/6/21.
//

import WatchKit
import UIKit
import WatchConnectivity

// MARK: - Video Properties
// Video codec: H.264 High Profile
// Bit rate: 160 kpbs at up to 30 fps
// 16:9 resolution: 320 x 180 in landscape orientation
// Audio bit rate: 32 kpbs stereo


class InterfaceController: WKInterfaceController, WCSessionDelegate {

    // MARK: - Watch Connectivity
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Watch WCSession activated")
        case .inactive:
            print("Watch WCSession inactive")
        case .notActivated:
            print("Watch WCSession not activated")
        default:
            print("Something went wrong on the WC Session activation!")
        } // End of Switch
    } // End of Function
    
    // Landing pad from phone
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("Received user info from Phone!")
        let fetchedUrl = userInfo["finalUrl"] as! String
        let fetchedTitle = userInfo["title"] as! String
        
        finalUrl = fetchedUrl
        videoTitle = fetchedTitle
        
        videoTitleLabel.setText(videoTitle)
    }

    
    // End of Watch Connectivity
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let session = WCSession.default
        session.delegate = self
        session.activate()
    }
    
    
    // MARK: - Outlets
    @IBOutlet weak var videoTitleLabel: WKInterfaceLabel!
    
    
    // MARK: - Properties
    var finalUrl: String?
    var videoTitle: String?

    
    // MARK: - Functions
    func downloadVideo() {
//        guard let finalUrl = finalUrl else { return }
        let finalUrl = "https://d2c3ct5w4v6137.cloudfront.net/youtube_rlz-K7FaaA4d/18/FERRARI%20488%20GTB%20*CAPRISTO%20EXHAUST*%20POV%20Test%20Drive%20by%20AutoTopNL_360P.mp4"
        print("Downloading video...")
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: finalUrl) {
                let options = [WKMediaPlayerControllerOptionsAutoplayKey: true]
                self.presentMediaPlayerController(with: url, options: options) { (didPlayToEnd, endTime, error) -> Void in
                    print("Video finished")
                }
            }
        } // End of main async function
    } // End of DownloadVideo

    
    @IBAction func playBtn() {
        downloadVideo()
    } // End of Function
    
} // End of Class
