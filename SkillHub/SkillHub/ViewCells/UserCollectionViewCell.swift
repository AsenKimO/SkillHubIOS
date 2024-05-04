//
//  UserCollectionViewCell.swift
//  SkillHub
//
//  Created by Library User on 5/3/24.
//

import UIKit
import SDWebImage

class UserCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    private var userImageView = UIImageView()
    private var textViews = UIView()
    private var nameLabel = UILabel()
    private var titleLabel = UILabel()
    private var priceLabel = UILabel()
    
    // MARK: - Properties (data)
    static let reuse: String = "UserCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserImg()
        setupTextViews()
    }
    
    private func setupUserImg(){
        contentView.addSubview(userImageView)
        
        userImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTextViews(){
        contentView.addSubview(textViews)
        
        textViews.backgroundColor = .brown
        
        textViews.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((2/3)*contentView.frame.height)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.bottom.equalToSuperview().offset(-contentView.frame.height/10)
        }
        
        setupName()
        setupTitle()
        setupPrice()
    }
    
    private func setupName(){
        textViews.addSubview(nameLabel)
        nameLabel.textColor = CGColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        nameLabel.font = .systemFont(ofSize: 12, weight: .regular)
        nameLabel.textColor = .black // CHANGE
        
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(textViews.snp.height).multipliedBy(0.3)
        }
    }
    
    private func setupTitle(){
        textViews.addSubview(titleLabel)
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(textViews.snp.height).multipliedBy(0.5)
        }
    }
    
    private func setupPrice(){
        textViews.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: User) {
        userImageView.sd_setImage(with: URL(string: user.image_url))
        nameLabel.text = user.name.lowercased()
        titleLabel.text = user.title
        priceLabel.text = "$" + String(describing: user.products.first?.price ?? 0.0) + "/hr"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update layout frames here based on cell's contentView size
    }
}
