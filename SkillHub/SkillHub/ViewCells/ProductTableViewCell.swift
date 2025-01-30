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
    private let namePriceView = UIView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let descriptLabel = UILabel()
    
    // MARK: - Properties (data)
    static let reuse = "ProductTableViewCellReuse"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true

        setupNamePriceLabels()
        setUpDescriptLabel()
    }
    
    private func setupNamePriceLabels() {
        contentView.addSubview(namePriceView)
        
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        
        priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        priceLabel.textColor = .black
        priceLabel.textAlignment = .right
        priceLabel.setContentCompressionResistancePriority(.required, for: .horizontal)

        namePriceView.addSubview(nameLabel)
        namePriceView.addSubview(priceLabel)
        
        namePriceView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(24)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.top.bottom.right.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.right.top.bottom.right.equalToSuperview()
        }
    }
    
    private func setUpDescriptLabel() {
        descriptLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptLabel.textColor = .gray
        descriptLabel.numberOfLines = 0 // Allows multi-line text

        contentView.addSubview(descriptLabel)
        
        descriptLabel.snp.makeConstraints { make in
            make.top.equalTo(namePriceView.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func configure(product: Product){
        nameLabel.text = product.name
        priceLabel.text = String(format: "$%.2f", product.price)
        descriptLabel.text = product.description
    }
}

