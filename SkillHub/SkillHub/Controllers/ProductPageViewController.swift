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
    
    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view = UIScrollView()
        
        setupCoverImage()
        setupCompanyLabel()
        setupTitleLabel()
        setupWebButton()
        setupContactButton()
    }
    
    private func setupCoverImage() {
        coverImage.image = UIImage(named:"move-cover")
        view.addSubview(coverImage)
        
        coverImage.layer.cornerRadius = 5
        coverImage.contentMode = .scaleAspectFill
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        
        coverImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalToSuperview().offset(36)
            make.right.equalToSuperview().offset(-36)
            make.height.equalTo(coverImage.snp.width)
        }
    }
        
        
    private func setupCompanyLabel() {
        companyLabel.text = "Hired Hands"
        companyLabel.font = .systemFont(ofSize: 16, weight: .regular)
        companyLabel.textColor = .black // CHANGE
        
        view.addSubview(companyLabel)
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        coverImage.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(53)
        }
        
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "FA24 MOVING ASSIST"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black // CHANGE
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(53)
        }
        
        
        
    }
    
    private func setupWebButton() {
        websiteButton.setTitle("Website", for: <#T##UIControl.State#>)
        
        view.addSubview(websiteButton)
        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        
        websiteButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(95)
            make.left.equalToSuperview().offset(41)
        }
        
    }
    
    private func setupContactButton() {
        contactButton.setTitle("Contact", for: <#T##UIControl.State#>)
        
        view.addSubview(contactButton)
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        
        websiteButton.snp.makeConstraints { make in
            make.top.equalTo(websiteButton.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(41)
        }
        
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
