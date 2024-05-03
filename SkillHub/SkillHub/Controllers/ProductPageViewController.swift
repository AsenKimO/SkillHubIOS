//
//  ProductPageViewController.swift
//  SkillHub
//
//  Created by Nicole Lin on 5/2/24.
//

import UIKit
import SnapKit
import SDWebImage

class ProductPageViewController: UIViewController {
    
    // MARK: - Properties (view)
    private var coverImage = UIImageView()
    private var companyLabel = UILabel()
    private var titleLabel = UILabel()
    private var websiteButton = UIButton()
    private var contactButton = UIButton()
    
    private var scrollableView = UIScrollView()
    private var productCollView: UICollectionView!
    
    // MARK: - Properties (data)
    private let user: User
    
    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
//        view = UIScrollView()
        
        setupScrollView()
        setupCoverImage()
        setupCompanyLabel()
        setupTitleLabel()
        setupWebButton()
        setupContactButton()
    }
    
    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // do any subview customizations AFTER autolayout
    }
    
    private func setupScrollView(){
        view.addSubview(scrollableView)
        scrollableView.alwaysBounceVertical = true
        
        scrollableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupProducts() {
        let layout = UICollectionViewFlowLayout()
        productCollView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        
        
        view.addSubview(productCollView)
        
        productCollView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuse)
    
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    
    private func setupCoverImage() {
        coverImage.sd_setImage(with: URL(string: user.image_url))
        view.addSubview(coverImage)
        coverImage.backgroundColor = .brown
        
        coverImage.layer.cornerRadius = 15
        coverImage.contentMode = .scaleAspectFill
        
        coverImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalToSuperview().offset(36)
            make.right.equalToSuperview().offset(-36)
            make.height.equalTo(coverImage.snp.width)
        }
    }
        
        
    private func setupCompanyLabel() {
        companyLabel.text = user.name.lowercased()
        companyLabel.font = .systemFont(ofSize: 16, weight: .regular)
        companyLabel.textColor = .black // CHANGE
        
        view.addSubview(companyLabel)
        
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom).offset(30) //30
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(53)
        }
        
    }
    
    private func setupTitleLabel() {
        titleLabel.text = user.title.uppercased()
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black // CHANGE
        
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(0)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(53)
        }
        
    }
    
    private func setupWebButton() {
        websiteButton.setTitle("Website".uppercased(), for: .normal)
        
        view.addSubview(websiteButton)
        
        websiteButton.layer.cornerRadius = 5
        websiteButton.backgroundColor = .black
        websiteButton.setTitleColor(.white, for: .normal)
        websiteButton.setTitleColor(.white, for: .selected)
        websiteButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
        websiteButton.isUserInteractionEnabled = false
        websiteButton.clipsToBounds = true
        websiteButton.isEnabled = true
        
        websiteButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-95)
//            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(41)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalTo(310)
        }
        
    }
    
    private func setupContactButton() {
        contactButton.setTitle("Contact".uppercased(), for: .normal)
        
        view.addSubview(contactButton)
        contactButton.layer.cornerRadius = 5
        
        contactButton.backgroundColor = .brown
        contactButton.setTitleColor(.white, for: .normal)
        contactButton.setTitleColor(.white, for: .selected)
        contactButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
        contactButton.isUserInteractionEnabled = false
        contactButton.clipsToBounds = true
        
        contactButton.snp.makeConstraints { make in
            make.top.equalTo(websiteButton.snp.bottom).offset(12)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(41)
            make.height.equalTo(44)
            make.width.equalTo(310)
        }
        
    }
    
    func configure(filter: String, selected: Bool) {
        websiteButton.backgroundColor = selected ? .black : .darkGray
        websiteButton.isSelected = selected
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
