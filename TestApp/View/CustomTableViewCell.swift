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

class CustomTableViewCell: UITableViewCell {

    let profileImageView = UIImageView()
    let nameLabel = UILabel()
    let jobTitleDetailedLabel = UILabel()
    let containerView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    var viewModel: RowsCellViewModel? {
           didSet {
               bindViewModel()
           }
       }

       private func bindViewModel() {
        nameLabel.text = viewModel?.titles
        jobTitleDetailedLabel.text = viewModel?.descriptions
        let strURL = viewModel?.imageHrefs
        if strURL != "" {
            Alamofire.request(strURL!).responseImage{ response in
                
                if let image = response.result.value{
                
                    self.profileImageView.image = image
                }
                
            }
            
        }
        else{
           
            profileImageView.image = UIImage(named: "default")
        }
        
       }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        
        
         let marginGuide = contentView.layoutMarginsGuide
        
        containerView.clipsToBounds = true
       containerView.translatesAutoresizingMaskIntoConstraints = false
        
        

     containerView.topAnchor.constraint(equalTo:marginGuide.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:marginGuide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo:marginGuide.trailingAnchor).isActive = true
        
        containerView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        
        
        
        
        containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
       
         profileImageView.translatesAutoresizingMaskIntoConstraints = false

                profileImageView.leadingAnchor.constraint(equalTo:marginGuide.leadingAnchor, constant:10).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo:marginGuide.centerYAnchor).isActive = true
                
                profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
                profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true


        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo:marginGuide.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:profileImageView.trailingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant:20).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        
          jobTitleDetailedLabel.translatesAutoresizingMaskIntoConstraints = false
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:profileImageView.trailingAnchor, constant: 10).isActive = true
        

        jobTitleDetailedLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        jobTitleDetailedLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        jobTitleDetailedLabel.numberOfLines = 0
        jobTitleDetailedLabel.font = UIFont(name: "Avenir-Book", size: 14)

    }
    
    required init?(coder aDecoder: NSCoder) {
           
           super.init(coder: aDecoder)
       }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
