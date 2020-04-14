//
//  RowsCellViewModel.swift
//  TestApp
//
//  Created by Vijay Masal on 14/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//

protocol RowsCellViewModel {
    var rowsItem: Rows { get }
    var titles: String { get }
    var descriptions: String { get }
    var imageHrefs: String { get }
}



extension Rows : RowsCellViewModel{
    var rowsItem: Rows {
        return self
    }
    
    var titles : String{
        return title
    }
    
    var descriptions : String{
           return description
       }
    
    var imageHrefs : String{
           return imageHref
       }
    
    
}
