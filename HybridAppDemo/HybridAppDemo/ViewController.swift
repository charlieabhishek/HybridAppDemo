//
//  ViewController.swift
//  HybridAppExample
//
//  Created by Abhishek Kumar on 15/03/19.
//  Copyright © 2019 CharlieAbhishek. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore

class ViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentController = WKUserContentController()
        contentController.add(self, name: "callback")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        let userScript = WKUserScript(
            source: "callJSFunc()",
            injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
            forMainFrameOnly: true
        )
        
        contentController.addUserScript(userScript)
        
        webView = WKWebView(frame: view.frame, configuration: config)
        let path = Bundle.main.path(forResource: "web/demo", ofType: "html")
        let myURL = URL(fileURLWithPath: path!)
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
        self.view.addSubview(webView);
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //This function handles the events coming from javascript. We'll configure the javascript side of this later.
        //We can access properties through the message body, like this:
        guard let response = message.body as? String else{
            return
        }
        print("response = \(response)")
        sendToJavaScript(name: "Abhishek", age: 28)
    }
    
    func sendToJavaScript(name:String,age:Int){
        webView.evaluateJavaScript("javascipt:callJSFunc('\(name)')", completionHandler: nil)
    }
}

