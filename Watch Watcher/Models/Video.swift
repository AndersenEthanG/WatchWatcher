//
//  Video.swift
//  Watch Watcher
//
//  Created by Ethan Andersen on 8/25/21.
//

import Foundation

struct Video {
    let youTubeId: String?
    let youTubeTitle: String?
    let downloadUrl: String?
} // End of Video Struct


// JSON decoding stuff
struct TopLevel: Codable {
    let videoInfo: SecondLevel
    
    struct SecondLevel: Codable {
        let title: String
    }
} // End of JSON struct
