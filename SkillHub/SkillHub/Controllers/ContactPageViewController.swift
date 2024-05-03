//
//  ContactPageViewController.swift
//  SkillHub
//
//  Created by Asen Ou on 5/2/24.
//

import UIKit
import SnapKit
import SDWebImage

class ContactPageViewController: UIViewController {
    
    // MARK: - Properties (view)
    private var coverImage = UIImageView()
    private var companyLabel = UILabel()
    private var titleLabel = UILabel()
    
    private var messageTitle = UILabel()
    private var messageButton = UIButton()
    
    private var contactTitle = UILabel()
    private var contactEmail = UILabel()
    private var contactPhone = UILabel()
    
    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view = UIScrollView()
        
        setupCoverImage()
        setupCompanyLabel()
        setupTitleLabel()
        setupMessageTitle()
        setupMessageButton()
        setupContactTitle()
        setupContactEmail()
        setupContactPhone()
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
    
    private func setupMessageTitle() {
        messageTitle.text = "MESSAGE US"
        messageTitle.font = .systemFont(ofSize: 24, weight: .regular)
        messageTitle.textColor = .black // CHANGE
        
        view.addSubview(messageTitle)
        messageTitle.translatesAutoresizingMaskIntoConstraints = false
        
        messageTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(130)
            
        }
    }
    
    private func setupMessageButton() {
        messageButton.setTitle("SEND MESSAGE", for: .normal)
        
        view.addSubview(messageButton)
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        
        messageButton.snp.makeConstraints { make in
            make.top.equalTo(messageTitle.snp.bottom).offset(170)
            make.left.equalToSuperview().offset(41)
        }
        
    }
    
    private func setupContactTitle() {
        contactTitle.text = "CONTACT INFORMATION"
        contactTitle.font = .systemFont(ofSize: 18, weight: .regular)
        contactTitle.textColor = .black // CHANGE
        
        view.addSubview(contactTitle)
        contactTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contactTitle.snp.makeConstraints { make in
            make.top.equalTo(messageButton.snp.bottom).offset(55)
            make.left.equalToSuperview().offset(10)
            
        }
    }
    
    private func setupContactEmail() {
        contactEmail.text = "hired_hands@gmail.com"
        contactEmail.font = .systemFont(ofSize: 16, weight: .regular)
        contactEmail.textColor = .black // CHANGE
        
        view.addSubview(contactEmail)
        contactEmail.translatesAutoresizingMaskIntoConstraints = false
        
        contactEmail.snp.makeConstraints { make in
            make.top.equalTo(contactTitle.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(120)
            
        }
        
    }
    
    private func setupContactPhone() {
        contactPhone.text = "hired_hands@gmail.com"
        contactPhone.font = .systemFont(ofSize: 16, weight: .regular)
        contactPhone.textColor = .black // CHANGE
        
        view.addSubview(contactPhone)
        contactPhone.translatesAutoresizingMaskIntoConstraints = false
        
        contactPhone.snp.makeConstraints { make in
            make.top.equalTo(contactEmail.snp.bottom).offset(3)
            make.left.equalToSuperview().offset(153)
            
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
