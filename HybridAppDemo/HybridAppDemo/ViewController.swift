//
//  ViewController.swift
//  HybridAppExample
//
//  Created by Abhishek Kumar on 15/03/19.
//  Copyright © 2019 CharlieAbhishek. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "web/demo", ofType: "html")
        let myURL = URL(fileURLWithPath: path!)
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
}

