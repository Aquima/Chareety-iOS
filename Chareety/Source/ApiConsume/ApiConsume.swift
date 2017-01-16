//
//  ApiConsume.swift
//  QUIMA Development
//
//  Created by Raul Quispe on 12/11/16.
//  Copyright © 2016 Raul Quispe. All rights reserved.
//

import UIKit
import Foundation
struct Constants {
    static let API_KEY = "rKQnkLorXoqiEd49yMejQek6wUPn"
    static let API_URL = "http://api.chareety.org/v1/"
}
struct HTTP_METHOD {
    static let POST = "POST"
    static let GET = "GET"
}
enum TypeParam {
    case jsonBody
    case urlParams
}

class ApiConsume: NSObject{
    
    //MARK: Shared Instance
    
    static let sharedInstance : ApiConsume = {
        let instance = ApiConsume()
        return instance
    }()
    
    //MARK: Local Variable
    
    var emptyStringArray : [String]? = nil
    var configuration:URLSessionConfiguration!
    //MARK: Init
    
    convenience override init() {
        self.init(array : [])
       configuration = URLSessionConfiguration.background(withIdentifier: "ECBackgroundConfig")
    }
    
    //MARK: Init Array
    
    init( array : [String]) {
        emptyStringArray = array
    }
    /**
     NewSession: This function create new session for gives your app the ability to perform background downloads when your app is not running or, in iOS, while your app is suspended.
     
     @param Header String is add Token Value for Header Token.
    
     @return post NSNotification with name and object.
     */
    public func consumeDataWithNewSession(url:String, path:String, headers:Dictionary< String, String>,params:Dictionary< String, String>,typeParams:TypeParam,httpMethod:String,notificationName:String){
        var urlWithPathString:String!

        switch typeParams {

        case .urlParams:
            urlWithPathString =  "\(path)\(url)?\(params.stringFromHttpParameters())"
        default:
            urlWithPathString =  "\(path)\(url)"
        }
        //Request
        var request = URLRequest(url: URL(string: urlWithPathString)!)
        request.httpMethod = httpMethod
        request.addHeaders(headers: headers)
        
        let session:URLSession = URLSession.shared
       // session.configuration = self.configuration!
        session.dataTask(with: request) {data, response, err in
            if (data != nil){
                do {
                    
                    let jsonResult = try JSONSerialization.jsonObject(with: data!, options:
                        JSONSerialization.ReadingOptions.mutableContainers)
                    
                    print("response: \(jsonResult)") //this part works fine
                    let notificationName = Notification.Name(notificationName)
                    NotificationCenter.default.post(name: notificationName, object: jsonResult)
                    
                  //  print(jsonResult["team1"])
                    
                } catch {
                    
                    print("JSON Processing Failed")
                }

            }else{
                print(err as Any)
            }
            
            }.resume()
        
    }
  
}
