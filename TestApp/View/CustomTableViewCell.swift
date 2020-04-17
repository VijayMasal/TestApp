//
//  CustomTableViewCell.swift
//  TestApp
//
//  Created by Vijay Masal on 14/04/20.
//  Copyright © 2020 Vijay Masal. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
 // MARK: - CustomTableViewCell
class CustomTableViewCell: UITableViewCell {
    let imageHref = UIImageView()
    let title = UILabel()
    let descriptions = UILabel()
    let containerView = UIView()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var viewModel: RowsCellViewModel? {
           didSet {
               bindViewModel()
           }
       }
       private func bindViewModel() {
        title.text = viewModel?.titles
        descriptions.text = viewModel?.descriptions
        let strURL = viewModel?.imageHrefs
        if strURL != "" {
            Alamofire.request(strURL!).responseImage{ response in
                if let image = response.result.value{
                    self.imageHref.image = image
                }
            }
        }
        else{
            imageHref.image = UIImage(named: "default")
        }
       }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(containerView)
        containerView.addSubview(imageHref)
        containerView.addSubview(title)
        containerView.addSubview(descriptions)
        
         let marginGuide = contentView.layoutMarginsGuide
        containerView.clipsToBounds = true
       containerView.translatesAutoresizingMaskIntoConstraints = false
       containerView.topAnchor.constraint(equalTo:marginGuide.topAnchor).isActive = true
    containerView.leadingAnchor.constraint(equalTo:marginGuide.leadingAnchor).isActive = true
containerView.trailingAnchor.constraint(equalTo:marginGuide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
         imageHref.translatesAutoresizingMaskIntoConstraints = false
                imageHref.leadingAnchor.constraint(equalTo:marginGuide.leadingAnchor, constant:10).isActive = true
        imageHref.centerYAnchor.constraint(equalTo:marginGuide.centerYAnchor).isActive = true
                imageHref.widthAnchor.constraint(equalToConstant:70).isActive = true
                imageHref.heightAnchor.constraint(equalToConstant:70).isActive = true
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo:marginGuide.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo:imageHref.trailingAnchor, constant: 10).isActive = true
title.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant:20).isActive = true
        title.numberOfLines = 0
        title.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        
          descriptions.translatesAutoresizingMaskIntoConstraints = false
        descriptions.topAnchor.constraint(equalTo:self.title.bottomAnchor).isActive = true
        descriptions.leadingAnchor.constraint(equalTo:imageHref.trailingAnchor, constant: 10).isActive = true
        descriptions.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriptions.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        descriptions.numberOfLines = 0
        descriptions.font = UIFont(name: "Avenir-Book", size: 14)
    }
    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
