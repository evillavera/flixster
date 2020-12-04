//
//  WebViewViewController.swift
//  flixster
//
//  Created by Erik Villavera on 11/20/20.
//

import UIKit
import WebKit
class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let myURL = URL(string:"https://www.apple.com")
                let myRequest = URLRequest(url: myURL!)
                webView.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
