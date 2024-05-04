//
//  ProductTableViewCell.swift
//  SkillHub
//
//  Created by Library User on 5/3/24.
//

import UIKit
import SnapKit

class ProductTableViewCell: UITableViewCell {
    // MARK: - Properties (view)
    var namePriceView = UIView()
    var nameLabel = UILabel()
    var priceLabel = UILabel()
    var descriptLabel = UILabel()
    
    // MARK: - Properties (data)
    static let reuse: String = "ProductTableViewCellReuse"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupNamePriceLabels()
        setUpDescriptLabel()
    }
    
    private func setupNamePriceLabels() {
        setupNameLabel()
        setupPriceLabel()
        contentView.addSubview(namePriceView)
        
        namePriceView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    private func setupNameLabel() {
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black // CHANGE
        
        namePriceView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
//            make.width.equalTo(90)
        }
    }
        
    private func setupPriceLabel() {
        priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        priceLabel.textColor = .black // CHANGE
        
        namePriceView.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
//            make.left.equalTo(nameLabel.snp.right)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(40)
        }
    }
    
    private func setUpDescriptLabel() {
        descriptLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptLabel.textColor = .gray // CHANGE
        
        contentView.addSubview(descriptLabel)
        
        descriptLabel.snp.makeConstraints { make in
            make.top.equalTo(namePriceView.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    func configure(product: Product){
        nameLabel.text = product.name
        priceLabel.text = "$" + String(product.price)
        descriptLabel.text = product.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
