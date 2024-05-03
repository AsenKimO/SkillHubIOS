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
    private var scrollableView = UIScrollView()
    
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
        view.addSubview(scrollableView)

        scrollableView.isScrollEnabled = true
        scrollableView.alwaysBounceVertical = true
        
        scrollableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
        companyLabel.textColor = .brown // CHANGE
        
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
        
        scrollableView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(0)
            make.left.equalToSuperview().offset(53)
        }
    }
    
    private func setupMessageTitle() {
        messageTitle.text = "Message Us".uppercased()
        messageTitle.font = .systemFont(ofSize: 20, weight: .light)
        messageTitle.textColor = .brown // CHANGE
        
        scrollableView.addSubview(messageTitle)
        
        messageTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.centerX.equalTo(view.center.x)
            
        }
    }
    
    private func setupMessageInput() {
        messageInputTextView.backgroundColor = .white
        messageInputTextView.layer.cornerRadius = 5
        messageInputTextView.font = .systemFont(ofSize: 16)
        messageInputTextView.layer.borderWidth = 1
        messageInputTextView.layer.borderColor = UIColor.black.cgColor
        
        scrollableView.addSubview(messageInputTextView)
        
        messageInputTextView.snp.makeConstraints { make in
            make.top.equalTo(messageTitle.snp.bottom).offset(10)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(150)
            make.width.equalTo(300)
        }
        
    }
    
    private func setupMessageButton() {
        messageButton.setTitle("Send Message".uppercased(), for: .normal)
        
        scrollableView.addSubview(messageButton)
        
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
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(44)
            make.width.equalTo(300)
        }
        
    }
    
    private func setupContactTitle() {
        contactTitle.text = "Contact Information".uppercased()
        contactTitle.font = .systemFont(ofSize: 18, weight: .regular)
        contactTitle.textColor = .brown // CHANGE
        
        scrollableView.addSubview(contactTitle)
        contactTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contactTitle.snp.makeConstraints { make in
            make.top.equalTo(messageButton.snp.bottom).offset(55)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func setupContactEmail() {
        contactEmail.text = user.email.lowercased()
        contactEmail.font = .systemFont(ofSize: 14, weight: .regular)
        contactEmail.textColor = .black // CHANGE
        
        scrollableView.addSubview(contactEmail)
        contactEmail.translatesAutoresizingMaskIntoConstraints = false
        
        contactEmail.snp.makeConstraints { make in
            make.top.equalTo(contactTitle.snp.bottom).offset(5)
            make.centerX.equalTo(view.center.x)
        }
        
    }
    
    private func setupContactPhone() {
        contactPhone.text = "607-xxx-xxxx"
        contactPhone.font = .systemFont(ofSize: 14, weight: .regular)
        contactPhone.textColor = .black // CHANGE
        
        scrollableView.addSubview(contactPhone)
        contactPhone.translatesAutoresizingMaskIntoConstraints = false
        
        contactPhone.snp.makeConstraints { make in
            make.top.equalTo(contactEmail.snp.bottom).offset(3)
            make.left.equalToSuperview().offset(153)
            
        }
        
    }
    
    func configure(filter: String, selected: Bool) {
        messageButton.backgroundColor = selected ? .black : .darkGray
        messageButton.isSelected = selected
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
