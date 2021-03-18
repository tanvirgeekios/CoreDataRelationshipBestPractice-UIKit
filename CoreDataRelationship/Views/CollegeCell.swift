//
//  CollegeCell.swift
//  CoreDataRelationship
//
//  Created by MD Tanvir Alam on 18/3/21.
//

import UIKit

class CollegeCell: UITableViewCell {

    @IBOutlet weak var collegeNameTxt: UILabel!
    @IBOutlet weak var collegeUniversityTxt: UILabel!
    @IBOutlet weak var collegeAddressTxt: UILabel!
    @IBOutlet weak var collegeCityTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
