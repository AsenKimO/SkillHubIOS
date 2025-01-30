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
    
    private var cblack = UIColor(red: 43/255, green: 48/255, blue: 58/255, alpha: 1)
    private var cbrown = UIColor(red: 86/255, green: 61/255, blue: 45/255, alpha: 1)
    private var cpink = UIColor(red: 205/255, green: 137/255, blue: 135/255, alpha: 1)
    private var offWhite = UIColor(red: 247/255, green: 243/255, blue: 227/255, alpha: 1)
    private var cslate = UIColor(red: 109/255, green: 138/255, blue: 150/255, alpha: 1)
    
    
    // MARK: - Properties (data)
    private let user: User

    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = offWhite
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
        
        scrollContentView.backgroundColor = offWhite
        scrollContentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.left.equalTo(scrollView.contentLayoutGuide.snp.left).offset(36)
            make.right.equalTo(scrollView.contentLayoutGuide.snp.right).offset(-36)
//            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
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
        
        coverImage.layer.cornerRadius = 15
        coverImage.contentMode = .scaleAspectFill
        coverImage.clipsToBounds = true
        
        let overlayView = UIView()
            overlayView.backgroundColor = cbrown.withAlphaComponent(0.5) // Adjust alpha as needed
            coverImage.addSubview(overlayView)
            overlayView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        
        
        coverImage.snp.makeConstraints { make in
            make.top.equalTo(scrollContentView.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(coverImage.snp.width).multipliedBy(0.7)
        }
        
    }
    
    private func setupCompanyLabel() {
        companyLabel.text = user.name.lowercased()
        companyLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        companyLabel.textColor = cpink // CHANGE
        
        scrollContentView.addSubview(companyLabel)
        
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom).offset(20) //30
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    private func setupTitleLabel() {
        titleLabel.text = user.title.uppercased()
        titleLabel.font = .systemFont(ofSize: 28, weight: .heavy)
        titleLabel.textColor = cblack // CHANGE
        
        scrollContentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(-10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func setupMessageTitle() {
        messageTitle.text = "Message Us".uppercased()
        messageTitle.font = .systemFont(ofSize: 22, weight: .heavy)
        messageTitle.textColor = cslate
        
        scrollContentView.addSubview(messageTitle)
        
        messageTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupMessageInput() {
        messageInputTextView.backgroundColor = offWhite
        messageInputTextView.layer.cornerRadius = 5
        messageInputTextView.font = .systemFont(ofSize: 16)
        messageInputTextView.layer.borderWidth = 1
        messageInputTextView.layer.borderColor = cslate.cgColor
        
        messageInputTextView.textColor = cslate
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        messageInputTextView.textContainerInset = UIEdgeInsets(top: 18, left: 10, bottom: 10, right: 18)
        messageInputTextView.addSubview(paddingView)
    
        scrollContentView.addSubview(messageInputTextView)
        
        messageInputTextView.snp.makeConstraints { make in
            make.top.equalTo(messageTitle.snp.bottom).offset(0)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(180)
        }
        
    }
    
    private func setupMessageButton() {
        messageButton.setTitle("Send Message".uppercased(), for: .normal)
        
        scrollContentView.addSubview(messageButton)
        
        messageButton.layer.cornerRadius = 5
        messageButton.backgroundColor = cslate
        messageButton.setTitleColor(offWhite, for: .normal)
        messageButton.setTitleColor(offWhite, for: .selected)
        messageButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
        messageButton.isUserInteractionEnabled = true
        messageButton.clipsToBounds = true
        messageButton.isEnabled = true
        
        messageButton.snp.makeConstraints { make in
            make.top.equalTo(messageInputTextView.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
    }
    
    private func setupContactTitle() {
        contactTitle.text = "Contact Information".uppercased()
        contactTitle.font = .systemFont(ofSize: 18, weight: .light)
        contactTitle.textColor = cpink // CHANGE
        
        scrollContentView.addSubview(contactTitle)
        contactTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contactTitle.snp.makeConstraints { make in
            make.top.equalTo(messageButton.snp.bottom).offset(45)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupContactEmail() {
        contactEmail.text = user.email.lowercased()
        contactEmail.font = .systemFont(ofSize: 14, weight: .regular)
        contactEmail.textColor = .gray // CHANGE
        
        scrollContentView.addSubview(contactEmail)
        contactEmail.translatesAutoresizingMaskIntoConstraints = false
        
        contactEmail.snp.makeConstraints { make in
            make.top.equalTo(contactTitle.snp.bottom).offset(-4)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
    }
    
    private func setupContactPhone() {
        contactPhone.text = "607-xxx-xxxx"
        contactPhone.font = .systemFont(ofSize: 14, weight: .regular)
        contactPhone.textColor = .gray // CHANGE
        
        scrollContentView.addSubview(contactPhone)
        contactPhone.translatesAutoresizingMaskIntoConstraints = false
        
        contactPhone.snp.makeConstraints { make in
            make.top.equalTo(contactEmail.snp.bottom).offset(-12)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(30)
        }
        
    }
    
    func configure(filter: String, selected: Bool) {
        messageButton.backgroundColor = selected ? .black : .darkGray
        messageButton.isSelected = selected
    }

}
