//
//  YouTubeView.swift
//  Movies
//
//  Created by Daniil G on 01.07.2020.
//  Copyright © 2020 Daniil G. All rights reserved.
//

import UIKit
import WebKit

final class YouTubeView: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var webView: WKWebView!
    
    // MARK: - Properties
    var urlString = ""
    
    override func viewDidLoad() {
        webView.load(URLRequest(url: URL(string: urlString)!))
    }
    
}
