//
//  FeatUserCollectionViewCell.swift
//  SkillHub
//
//  Created by Library User on 5/3/24.
//

import UIKit

class FeatUserCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    private var userImageView = UIImageView()
    private var textViews = UIView()
    private var nameLabel = UILabel()
    private var titleLabel = UILabel()
    private var priceLabel = UILabel()
    
    private var cblack = UIColor(red: 43/255, green: 48/255, blue: 58/255, alpha: 1)
    private var cbrown = UIColor(red: 86/255, green: 61/255, blue: 45/255, alpha: 1)
    private var clbrown = UIColor(red: 232/255, green: 203/255, blue: 180/255, alpha: 1)
    private var clbrown2 = UIColor(red: 247/255, green: 243/255, blue: 227/255, alpha: 1)
    private var cpink = UIColor(red: 205/255, green: 137/255, blue: 135/255, alpha: 1)
    
    // MARK: - Properties (data)
    static let reuse: String = "FeatUserCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserImg()
        setupTextViews()
    }
    
    private func setupUserImg(){
        contentView.addSubview(userImageView)
        userImageView.layer.cornerRadius = 20
        userImageView.layer.masksToBounds = true
        
        let overlayView = UIView()
            overlayView.backgroundColor = cbrown.withAlphaComponent(0.75) // Adjust alpha as needed
            userImageView.addSubview(overlayView)
            overlayView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        
        userImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    private func setupTextViews(){
        contentView.addSubview(textViews)
        
        textViews.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
        
        setupName()
        setupTitle()
        setupPrice()
    }
    
    private func setupName(){
        textViews.addSubview(nameLabel)
        nameLabel.font = .systemFont(ofSize: 12, weight: .bold)
        nameLabel.textColor = clbrown // CHANGE
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(125)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(textViews.snp.height)
        }
    }
    
    private func setupTitle(){
        textViews.addSubview(titleLabel)
        titleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        titleLabel.textColor = clbrown // CHANGE
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(-85)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    
    }
    
    private func setupPrice(){
        textViews.addSubview(priceLabel)
        priceLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        priceLabel.textColor = clbrown2 // CHANGE
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: User) {
        userImageView.sd_setImage(with: URL(string: user.image_url))
        nameLabel.text = user.name.lowercased()
        titleLabel.text = user.title.uppercased()
        priceLabel.text = "$" + String(describing: Int(user.products.first?.price ?? 0.0)) + "-$" + String(describing: Int(user.products[1].price)) + "/hr"
    }
}
