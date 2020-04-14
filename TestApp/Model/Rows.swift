//
//  Rows.swift
//  TestApp
//
//  Created by Vijay Masal on 14/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//

struct Rows: Codable {
    let title:String
    let description:String
    let imageHref:String

}


struct Facts : Codable {
    let title : String
    let row : [Rows]
}
