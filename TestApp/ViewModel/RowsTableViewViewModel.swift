//
//  RowsTableViewViewModel.swift
//  TestApp
//
//  Created by Vijay Masal on 14/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//
// MARK: -ViewModel
class RowsTableViewViewModel {
    enum RowsTableViewCellType {
        case normal(cellViewModel: RowsCellViewModel)
        case error(message: String)
        case empty
    }
    let showLoadingHud: Bindable = Bindable(false)
     let rowsCells = Bindable([RowsTableViewCellType]())
    let appServerClient: AppServerClient
    var title : String = ""
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
   func getFactsData() {
        appServerClient.getFacts(completion: { [weak self] result in
            switch result {
            case .success(let friends):
                self!.title = friends.title
                guard friends.row.count > 0 else {
                    self?.rowsCells.value = [.empty]
                    return
                }
                self?.rowsCells.value = friends.row.compactMap { .normal(cellViewModel: $0 as RowsCellViewModel)}
            case .failure(let error):
                self?.rowsCells.value = [.error(message: error?.getErrorMessage() ?? "Loading failed, check network connection")]
            }
        })
    }
}
fileprivate extension AppServerClient.GetFriendsFailureReason {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "Please login to load your friends."
        case .notFound:
            return "Could not complete request, please try again."
        }
    }
}



