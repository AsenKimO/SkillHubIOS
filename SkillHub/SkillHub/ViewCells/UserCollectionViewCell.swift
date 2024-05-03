//
//  UserCollectionViewCell.swift
//  SkillHub
//
//  Created by Library User on 5/3/24.
//

import UIKit

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
        contentView.backgroundColor = .red
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
            make.top.equalToSuperview().offset(2*contentView.frame.height/3)
            make.left.equalToSuperview().offset(contentView.frame.width/10)
            make.right.equalToSuperview().offset(-contentView.frame.width/10)
            make.bottom.equalToSuperview().offset(-contentView.frame.height/10)
        }
        
        setupName()
        setupTitle()
        setupPrice()
    }
    
    private func setupName(){
        textViews.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo((2/10)*98*textViews.frame.height/100)
        }
    }
    
    private func setupTitle(){
        textViews.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(textViews.frame.height/100)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo((5/10)*98*textViews.frame.height/100)
        }
    }
    
    private func setupPrice(){
        textViews.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(textViews.frame.height/100)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo((3/10)*98*textViews.frame.height/100)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: User) {
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update layout frames here based on cell's contentView size
    }
}
