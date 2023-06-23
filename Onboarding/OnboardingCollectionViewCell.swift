//
//  OnboardingCollectionViewCell.swift
//  Onboarding
//
//  Created by Thành Mai on 22/06/2023.
//

import UIKit

class OnboardingCollectionViewCell: ReusableCollectionViewCell {

    @IBOutlet weak var descLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var avartaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(data: OnboardingModel) {
        descLable.text = data.description
        titleLable.text = data.title
        avartaImageView.image = UIImage(named: data.logo)
    }
    
}
