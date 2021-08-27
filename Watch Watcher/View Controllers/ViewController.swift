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
import SafariServices
import WatchConnectivity


class ViewController: UIViewController, WCSessionDelegate {
    
    // MARK: - Watch Connectivity
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Phone WCSession activated")
        case .inactive:
            print("Phone WCSession inactive")
        case .notActivated:
            print("Phone WCSession not activated")
        default:
            print("Something went wrong on the Phone WC Session activation!")
        } // End of Switch
    }
    func sessionDidBecomeInactive(_ session: WCSession) { print("Phone session did become inactive") }
    func sessionDidDeactivate(_ session: WCSession) { print("Phone session did deactivate") }
    // End of Watch Connectivity
    
    
    // MARK: - Outlets
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var videoIdField: UITextField!
    
    
    // MARK: - Properties
    var session = WCSession.default
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Watch Connectivity support
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    } // End of View Did load
    
    
    // MARK: - Actions
    @IBAction func sendToWatchBtn(_ sender: Any) {
        if videoIdField.text == "" {
            present(okAlert(title: "Error", message: "Please fill out all fields"), animated: true, completion: nil)
        } else {
            VideoController.getDownloadUrl(videoId: videoIdField.text!) { fetchedVideo in
                let videoMessage = [ "finalUrl" : fetchedVideo.downloadUrl, "title" : fetchedVideo.youTubeTitle]
    
                if self.session.activationState == .activated {
//                    print(videoMessage)
                    self.session.transferUserInfo(videoMessage)
                }
            } // End of Get Download URL
        } // End of If Else
        present(okAlert(title: "Sent!", message: "Your Apple Watch should be updated!"), animated: true, completion: nil)
    } // End of Send to watch
    
    // This pulls up a Web View to let the user search through YouTube
    @IBAction func findVideoBtn(_ sender: Any) {
        if searchField.text == "" {
            present(okAlert(title: "Error", message: "Please fill out all fields"), animated: true, completion: nil)
        } else {
            let finalUrl = URL(string: youTubeUrlFixer(searchTerm: searchField.text!))
            
            let vc = SFSafariViewController(url: finalUrl!)
            searchField.text = ""
            
            present(vc, animated: true, completion: nil)
        } // End of If statement
    } // End of Find video
    
    
    // MARK: - Functions
    // This function makes the keyboard go away when typing around
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    } // End of Function
    

} // End of View Controller

