//
//  SearchResultTableViewCell.swift
//  starWars
//
//  Created by etudiant on 18/01/2022.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
