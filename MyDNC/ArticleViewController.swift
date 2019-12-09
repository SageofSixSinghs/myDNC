//
//  ArticleViewController.swift
//  MyDNC
//
//  Created by Sandeep Singh on 12/7/19.
//  Copyright © 2019 Sandeep Singh. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON

class ArticleViewController: UIViewController {

    
    var sort = "relevance"
    var candidateName = String()
    var apiURL = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q="
    
    var articlesArray: [Articles] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(candidateName)
        getData() {
            self.tableView.reloadData()
            print(self.articlesArray)
        }
        
        // Do any additional setup after loading the view.
    }
    
    func getData(completed: @escaping ()-> ()) {
        let apiURL = self.apiURL + self.candidateName + "&api-key=OLLsnCWU5XPHdTO4YH51iYbQy2WprAoG"
        Alamofire.request(apiURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("json \(json)")
                for index in 0...json["response"]["docs"].count-1 {
                    let articleName = json["response"]["docs"][index]["abstract"].stringValue
                    let articleURL = json["response"]["docs"][index]["web_url"].stringValue
                    self.articlesArray.append(Articles(articleName: articleName, articleURL: articleURL))
//                    print(self.articlesArray[index].articleName)
//                    print(self.articlesArray[index].articleURL)
                    //print(self.categoryArray[index].title)
                }
            case .failure(let error):
                print("ERROR: \(error) failure to get data from URL \(apiURL)")
            }
            completed()
        }
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        //let isPresentingInAddMode = presentingViewController is UINavigationController
        dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
        
    }
    
    

}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.text = articlesArray[indexPath.row].articleName
//        cell.detailTextLabel?.text = articlesArray[indexPath.row].articleURL
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleURL = articlesArray[indexPath.row].articleURL
        guard let url = URL(string: articleURL) else { return }
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let myWebView: WKWebView = WKWebView(frame: frame)
        myWebView.load(URLRequest(url: url))
        self.view.addSubview(myWebView)
    }
    
}
