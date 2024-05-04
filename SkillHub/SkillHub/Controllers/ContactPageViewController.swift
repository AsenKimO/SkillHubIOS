//
//  ContactPageViewController.swift
//  SkillHub
//
//  Created by Nicole Lin on 5/2/24.
//

import UIKit
import SnapKit
import SDWebImage

class ContactPageViewController: UIViewController {
    
    // MARK: - Properties (view)
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    
    private var coverImage = UIImageView()
    private var companyLabel = UILabel()
    private var titleLabel = UILabel()
    
    private var messageTitle = UILabel()
    private var messageInputTextView = UITextView()
    private var messageButton = UIButton()
    
    private var contactTitle = UILabel()
    private var contactEmail = UILabel()
    private var contactPhone = UILabel()
    
    
    // MARK: - Properties (data)
    private let user: User

    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
//        view = UIScrollView()
        
        setupScrollView()
        setupCoverImage()
        setupCompanyLabel()
        setupTitleLabel()
        setupMessageTitle()
        setupMessageInput()
        setupMessageButton()
        setupContactTitle()
        setupContactEmail()
        setupContactPhone()
    }
    
    private func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.contentLayoutGuide.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(scrollContentView)
        
        scrollContentView.backgroundColor = .white
        scrollContentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.left.equalTo(scrollView.contentLayoutGuide.snp.left).offset(36)
            make.right.equalTo(scrollView.contentLayoutGuide.snp.right).offset(-36)
            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
//            make.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
        }
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
        scrollContentView.addSubview(coverImage)
        coverImage.backgroundColor = .brown
        
        coverImage.layer.cornerRadius = 15
        coverImage.contentMode = .scaleAspectFill
        coverImage.clipsToBounds = true
        
        coverImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(coverImage.snp.width)
        }
        
    }
    
    private func setupCompanyLabel() {
        companyLabel.text = user.name.lowercased()
        companyLabel.font = .systemFont(ofSize: 16, weight: .regular)
        companyLabel.textColor = .brown // CHANGE
        
        scrollContentView.addSubview(companyLabel)
        
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    private func setupTitleLabel() {
        titleLabel.text = user.title.uppercased()
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black // CHANGE
        
        scrollContentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    private func setupMessageTitle() {
        messageTitle.text = "Message Us".uppercased()
        messageTitle.font = .systemFont(ofSize: 20, weight: .light)
        messageTitle.textColor = .brown // CHANGE
        
        scrollContentView.addSubview(messageTitle)
        
        messageTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupMessageInput() {
        messageInputTextView.backgroundColor = .white
        messageInputTextView.layer.cornerRadius = 5
        messageInputTextView.font = .systemFont(ofSize: 16)
        messageInputTextView.layer.borderWidth = 1
        messageInputTextView.layer.borderColor = UIColor.black.cgColor
        
        scrollContentView.addSubview(messageInputTextView)
        
        messageInputTextView.snp.makeConstraints { make in
            make.top.equalTo(messageTitle.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
    }
    
    private func setupMessageButton() {
        messageButton.setTitle("Send Message".uppercased(), for: .normal)
        
        scrollContentView.addSubview(messageButton)
        
        messageButton.layer.cornerRadius = 5
        messageButton.backgroundColor = .black
        messageButton.setTitleColor(.white, for: .normal)
        messageButton.setTitleColor(.white, for: .selected)
        messageButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
        messageButton.isUserInteractionEnabled = false
        messageButton.clipsToBounds = true
        messageButton.isEnabled = true
        
        messageButton.snp.makeConstraints { make in
            make.top.equalTo(messageInputTextView.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
    }
    
    private func setupContactTitle() {
        contactTitle.text = "Contact Information".uppercased()
        contactTitle.font = .systemFont(ofSize: 18, weight: .regular)
        contactTitle.textColor = .brown // CHANGE
        
        scrollContentView.addSubview(contactTitle)
        contactTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contactTitle.snp.makeConstraints { make in
            make.top.equalTo(messageButton.snp.bottom).offset(55)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupContactEmail() {
        contactEmail.text = user.email.lowercased()
        contactEmail.font = .systemFont(ofSize: 14, weight: .regular)
        contactEmail.textColor = .black // CHANGE
        
        scrollContentView.addSubview(contactEmail)
        contactEmail.translatesAutoresizingMaskIntoConstraints = false
        
        contactEmail.snp.makeConstraints { make in
            make.top.equalTo(contactTitle.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
    }
    
    private func setupContactPhone() {
        contactPhone.text = "607-xxx-xxxx"
        contactPhone.font = .systemFont(ofSize: 14, weight: .regular)
        contactPhone.textColor = .black // CHANGE
        
        scrollContentView.addSubview(contactPhone)
        contactPhone.translatesAutoresizingMaskIntoConstraints = false
        
        contactPhone.snp.makeConstraints { make in
            make.top.equalTo(contactEmail.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    func configure(filter: String, selected: Bool) {
        messageButton.backgroundColor = selected ? .black : .darkGray
        messageButton.isSelected = selected
    }

}
