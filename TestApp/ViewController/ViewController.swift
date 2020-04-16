//
//  ViewController.swift
//  TestApp
//
//  Created by Vijay Masal on 14/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//

import UIKit
/**
 ViewController shows facts into tableview, inside tableview using custom cell into custom cell show title, description, imageHref.
 Tableview and cutom cell using programatic constraint using Anchor constraint.
 */
class ViewController: UIViewController {
let viewModel: RowsTableViewViewModel = RowsTableViewViewModel()
    var factTableView = UITableView()
    var safeArea : UILayoutGuide!
    override func loadView() {
        super.loadView()
       
        bindViewModel()
        viewModel.getFactsData()
        setUpTableview()
    }
    
    /**Bind Data from RowsTableViewViewModel */
    func bindViewModel() {
    viewModel.rowsCells.bindAndFire() { [weak self] _ in
        self?.title = self?.viewModel.title
        self?.factTableView.reloadData()
    }
    }
    /** Add tableview constraint using Anchor */
    func setUpTableview()  {
    self.factTableView = UITableView(frame: self.factTableView.frame, style: .grouped)
         self.view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        view.addSubview(factTableView)
        factTableView.translatesAutoresizingMaskIntoConstraints = false
        factTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        factTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        factTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        factTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        factTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        factTableView.estimatedRowHeight = 80
        factTableView.rowHeight = UITableView.automaticDimension
        self.factTableView.accessibilityIdentifier = "factTableView"
        DispatchQueue.main.async {
            self.factTableView.dataSource = self
            self.factTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowsCells.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.rowsCells.value[indexPath.row] {
               case .normal(let viewModel):
                   guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
                       return UITableViewCell()
                   }

                   cell.viewModel = viewModel
                   return cell
               case .error(let message):
                   let cell = UITableViewCell()
                   cell.isUserInteractionEnabled = false
                   cell.textLabel?.text = message
                   return cell
               case .empty:
                   let cell = UITableViewCell()
                   cell.isUserInteractionEnabled = false
                   cell.textLabel?.text = "No data available"
                   return cell
               }
        
    }
    
    
}


