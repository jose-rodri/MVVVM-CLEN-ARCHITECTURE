//
//  HomeTableViewCell.swift
//  JoseRodriguez
//
//  Created by Jose Leoncio Quispe Rodriguez on 30/05/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var descriptionM: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!

    
    weak var delegate: HomeDelegateTableActionDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    static var cellType: String {
        return String(describing: self)
    }
    
    
    func configureView() {
        mView.layer.shadowColor = UIColor.gray.cgColor
        mView.layer.shadowOffset = CGSize.zero
        mView.layer.cornerRadius = 8.0
        mView.layer.shadowOpacity = 2.9
       
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
