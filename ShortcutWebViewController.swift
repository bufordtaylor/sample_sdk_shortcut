//
//  ShortcutWebViewController.swift
//

import Foundation

class ShortcutWebViewController: UIViewController, UIWebViewDelegate {
  
  var webView: UIWebView!
  var urlPath: String!
  
  init(eventId: Int) {
    super.init(nibName: nil, bundle: nil)
    
    urlPath = "http://shortcutapp.dev/webflow/events/\(eventId)"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    webView = UIWebView()
    var frame = view.frame
    if navigationController != nil {
      frame.size.height -= 64
    }
    webView.frame = frame
    webView.delegate = self
    view.addSubview(webView)
    
    loadWebView()
  }
  
  override func viewWillAppear(animated: Bool) {  }
  
  func loadWebView(addingToURL: String = "") {
    let url = NSURL(string: urlPath)!
    let request = NSMutableURLRequest(URL: url)

    webView.loadRequest(request)
  }
  
  // MARK: UIWebView Delegate Methods
  
  func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    let connection = NSURLConnection(request: request, delegate: self)
    return connection != nil
  }
  
  // MARK: NSCoder protocol
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}