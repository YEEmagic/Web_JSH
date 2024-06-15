//
//  ViewController.swift
//  Web_JSH
//
//  Created by 232-09 on 2024/06/15.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var txtUrl: UITextField!
    
    @IBOutlet var SegmentControl: UISegmentedControl!
    
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage("https://www.mk.co.kr/")
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
        
    }
    @IBAction func SegmentChanged(_ sender: UISegmentedControl) {
        loadPage(index: sender.selectedSegmentIndex)
            }

    func loadPage(index: Int) {
        var urlString: String
        
        switch index {
        case 0:
            urlString = "https://www.mk.co.kr/"
        case 1:
            urlString = "https://www.hankyung.com/"
        case 2:
            urlString = "https://www.chosun.com/"
        case 3:
            urlString = "https://www.hani.co.kr/"
        default:
            return
        }
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            myWebView.load(request)
        }
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}

