//
//  NewsData.swift
//  News tvOS app
//
//  Created by nayan.khadase on 17/11/21.
//  Copyright © 2021 nayan.khadase. All rights reserved.
//

import Foundation




class NewsData {
    var newsArray: [NewsArray] = []
    
    var articalArray: [[String: Any]] = [[:]]
    
    let baseUrl = "https://newsapi.org/v2/top-headlines?country=in"
    let apiId = "&apiKey=7f8c5a29220740d6b597f9860ce7e240"
    
    func fetchData(for category: String){
        let myUrl = baseUrl + apiId + "&category=\(category)"
        if let url = URL(string: myUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let e = error{
                    print("errors while resuming task: \(e)")
                    return
                }else{
                    do{
                        let parseData = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                        //print(parseData)
                        for (key, value) in parseData{
                            if key == "articles"{
                                //let articalArray = value as! [[String: Any]]
                                //self.delegate?.didUpdateNewsData(newsData: articalArray)
                                
                                //print(self.articalArray[0]["title"]!)
                                //print(value)
                                if let articleArray: [ [String: Any] ] = value as? [ [String: Any] ]{
                                    for dict in articleArray{
                                        var title: String?
                                        var desc: String?
                                        for (key, value) in dict{
                                            if key == "title"{
                                                title = "\(value)"
                                            }
                                            else if key == "description"{
                                                desc = "\(value)"

                                            }

                                        }
                                        self.newsArray.append(NewsArray(title: title!, desc: desc!))

                                    }
                                }
                               //print(self.newsArray.count)
                            }
                            
                        }
                        
                        
                    }catch{
                        print("error while getting data \(error)")
                    }
                }
            }
            task.resume()
        }
    }
    
    
   
    
}
