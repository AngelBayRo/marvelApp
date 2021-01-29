//
//  CharacterTableViewCell.swift
//  Marvel
//

import UIKit

class CharacterTableViewCell: BaseTableViewCell<CharacterViewModel> {

    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        self.imageImageView.image = nil
        self.nameLabel.text = nil
        self.descriptionLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configure(cellModel: CharacterViewModel) {
        super.configure(cellModel: cellModel)
        
        self.nameLabel.text = cellModel.name
        self.descriptionLabel.text = cellModel.description
        
        if let imageURL = cellModel.imageURL, let url = URL(string: imageURL) {
            DispatchQueue.global().async {
                guard let data = try? Data(contentsOf: url) else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageImageView.image = image
                }
            }
        }
    }
    
}
