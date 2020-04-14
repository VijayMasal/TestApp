//
//  Result.swift
//  TestApp
//
//  Created by Vijay Masal on 14/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//

enum Result<T,U : Error> {
    case success(payload:T)
    case failure(U?)
}


enum EmpltyError<U : Error> {
    case success
    case failure(U?)
}
