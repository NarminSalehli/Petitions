//
//  DetailViewController.swift
//  Project7.2
//
//  Created by Nərmin Salehli on 23.07.26.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        guard let detailItem = detailItem else { return }
        
        let html = """
            <html>
            <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <style> body{
            font-size:160%;
            font-family:-apple-system;
            padding:20px;
            line-height:1.6;
            background-color:#F5F5F5;
            }
            </style>
            </head>
            <body>
            \(detailItem.body)
            </body>
            </html>
            """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
}
