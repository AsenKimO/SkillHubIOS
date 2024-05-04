//
//  AddPageProdCollectionViewCell.swift
//  SkillHub
//
//  Created by Library User on 5/3/24.
//

import UIKit

class AddPageProdCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    var nameLabel = UILabel()
    var priceLabel = UILabel()
    var descriptLabel = UILabel()
    
    // MARK: - Properties (data)
    static let reuse: String = "AddPageProdCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = String(product.price)
        descriptLabel.text = product.description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
