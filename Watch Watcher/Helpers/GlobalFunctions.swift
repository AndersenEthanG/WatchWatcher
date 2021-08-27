//
//  GlobalFunctions.swift
//  Watch Watcher
//
//  Created by Ethan Andersen on 8/25/21.
//

import UIKit

func okAlert(title: String, message: String) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okBtn = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(okBtn)
    
    return alert
} // End of Functions

func URLFixer(videoId: String, rawTitle: String) -> String {
    let cleanVideoId = videoIdCleaner(videoId: videoId)
    var cleansedTitle = rawTitle.stringByAddingPercentEncodingForRFC3986()
    cleansedTitle = cleansedTitle?.replacingOccurrences(of: "%27", with: "%20")
    
    let finalString = ("https://d2c3ct5w4v6137.cloudfront.net/youtube_" + cleanVideoId + "/18/" + cleansedTitle! + "_360P.mp4")
    
    return finalString
} // End of URL fixer

func youTubeUrlFixer(searchTerm: String) -> String {
    let cleanSearch = searchTerm.replacingOccurrences(of: " ", with: "+")
    
    let finalUrl = (StringConstants.youTubeSearchUrl + cleanSearch)
    
    return finalUrl
} // End of Youtube url fixer

func videoIdCleaner(videoId: String) -> String {
    var cleanVideoId: String = videoId
    if cleanVideoId.hasPrefix(StringConstants.youTubeShortHand) {
        cleanVideoId = String(cleanVideoId.dropFirst(StringConstants.youTubeShortHand.count))
    }
    return cleanVideoId
} // End of Video ID cleaner


extension String {
  func stringByAddingPercentEncodingForRFC3986() -> String? {
    let unreserved = "-._~/?"
    let allowed = NSMutableCharacterSet.alphanumeric()
    allowed.addCharacters(in: unreserved)
    return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
  }
} // End of Extension
