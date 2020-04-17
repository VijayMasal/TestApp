//
//  AppServerClient.swift
//  TestApp
//
//  Created by Vijay Masal on 14/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//
import Alamofire
// MARK: - AppServerClient
class AppServerClient {
    enum GetFriendsFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    typealias GetFriendsResult = Result<Facts, GetFriendsFailureReason>
    typealias GetFriendsCompletion = (_ result: GetFriendsResult) -> Void
    func getFacts(completion: @escaping GetFriendsCompletion) {
        var rowsData = [Rows]()
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
            Alamofire.request(url).responseJSON { response in
                      
            if let d = response.data {
                    if let value = String(data: d, encoding: String.Encoding.ascii) {
                       if let jsonData = value.data(using: String.Encoding.utf8) {
                                             do {
                                                 let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                                                let title = json["title"] as? String
                                                 if let arr = json["rows"] as? [[String: Any]] {
                                                     for arr1 in arr {
                                                         let title = arr1["title"] as? String
                                                         let description = arr1["description"] as? String
                                                         let imageHref = arr1["imageHref"] as? String
                                                         let row =  Rows(title: title ?? "" , description: (description ?? "" ), imageHref: imageHref ?? "" )
                                                        rowsData.append(row)
                                                     }
                                                    
                                               let  fact = Facts(title: title!, row: rowsData)
                                                    completion(.success(payload: fact))
                                                 }
                                             } catch {
                                                 NSLog("ERROR \(error.localizedDescription)")
                                                completion(.failure(nil))
                                             }
                                         }
                                     }
                                 }
        }
       }
}

