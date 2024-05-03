//
//  ProductCollectionViewCell.swift
//  SkillHub
//
//  Created by Nicole Lin on 5/3/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties (view)
    var nameLabel = UILabel()
    var priceLabel = UILabel()
    var descriptLabel = UILabel()
    
    // MARK: - Properties (data)
    //    private let product: Product
    private var productId = 0
    static let reuse: String = "ProductCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupNameLabel()
        setupPriceLabel()
        setUpDescriptLabel()
    }
    
    func configure(with product: Product) {
        productId = product.id
        nameLabel.text = product.name
        priceLabel.text = String(product.price)
        descriptLabel.text = product.description
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupNameLabel() {
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black // CHANGE
        
        contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(52)
        }
    }
        
    private func setupPriceLabel() {
        priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        priceLabel.textColor = .black // CHANGE
        
        contentView.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(52)
            make.left.equalTo(nameLabel.snp.right).offset(52)
        }
    }
    
    private func setUpDescriptLabel() {
        descriptLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptLabel.textColor = .gray // CHANGE
        
        contentView.addSubview(descriptLabel)
        
        descriptLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel.snp.right).offset(52)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
