//
//  ListItem.swift
//  unsplash_beta
//
//  Created by Jordy De Jonghe on 05/10/2022.
//

import UIKit
import SDWebImage

class ListItem: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var listImage: UIImageView!
    
    var movie: Movie? {
        didSet{
            title.text = movie?.titleLong
            listImage.sd_setImage(with: URL(string: movie?.mediumCoverImage))
            self.selectionStyle = .none
        }
    }
    
}
