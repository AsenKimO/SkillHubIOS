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
    static let reuse: String = "ProductCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupNameLabel()
        setupPriceLabel()
        setUpDescriptLabel()
    }
    
    func configure(with product: Product) {
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
//            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top)
//            make.left.equalTo(contentView.safeAreaLayoutGuide.snp.left)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(25)
        }
    }
        
    private func setupPriceLabel() {
        priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        priceLabel.textColor = .black // CHANGE
        
        contentView.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(nameLabel.snp.right)
            make.right.equalTo(contentView.safeAreaLayoutGuide.snp.right)
            make.height.equalTo(nameLabel.snp.height)
            make.width.equalTo(40)
        }
    }
    
    private func setUpDescriptLabel() {
        descriptLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptLabel.textColor = .gray // CHANGE
        
        contentView.addSubview(descriptLabel)
        
        descriptLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(contentView.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(contentView.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
