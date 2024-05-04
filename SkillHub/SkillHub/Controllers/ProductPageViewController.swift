//
//  ProductPageViewController.swift
//  SkillHub
//
//  Created by Nicole Lin on 5/2/24.
//

import UIKit
import SnapKit
import SDWebImage
import WebKit

class ProductPageViewController: UIViewController {
    
    // MARK: - Properties (view)
    private var coverImage = UIImageView(image: UIImage(systemName: "figure.walk"))
    private var companyLabel = UILabel()
    private var titleLabel = UILabel()
    private var websiteButton = UIButton()
    private var contactButton = UIButton()
    
    private var webView = WKWebView()
    private var popupWebView = WKWebView()
    
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    private var productCollView: UICollectionView!
    
    // MARK: - Properties (data)
    private let user: User
    
    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupScrollView()
        setupCoverImage()
        setupCompanyLabel()
        setupTitleLabel()
        setupProducts()
        setupWebButton()
        setupContactButton()
//        setupWebView()
    }
    
    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // do any subview customizations AFTER autolayout
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    private func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(36)
            make.right.equalToSuperview().offset(-36)
        }
        
        scrollView.contentLayoutGuide.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(scrollContentView)
        
        scrollContentView.backgroundColor = .white
        scrollContentView.snp.makeConstraints { make in
//            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
//            make.left.equalTo(scrollView.contentLayoutGuide.snp.left)
//            make.right.equalTo(scrollView.contentLayoutGuide.snp.right)
//            make.height.equalTo(2500)
            make.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
        }
    }
    
    private func setupCoverImage() {
        coverImage.sd_setImage(with: URL(string: user.image_url))
        
        scrollContentView.addSubview(coverImage)
        coverImage.backgroundColor = .brown
        
        coverImage.layer.cornerRadius = 15
        coverImage.contentMode = .scaleAspectFill
        coverImage.clipsToBounds = true
        
        coverImage.snp.makeConstraints { make in
            make.top.equalTo(scrollContentView.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(coverImage.snp.width)
        }
    }
        
        
    private func setupCompanyLabel() {
        companyLabel.text = user.name.lowercased()
        companyLabel.font = .systemFont(ofSize: 16, weight: .regular)
        companyLabel.textColor = .black // CHANGE
        
        scrollContentView.addSubview(companyLabel)
        
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom).offset(30) //30
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
    }
    
    private func setupTitleLabel() {
        titleLabel.text = user.title.uppercased()
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black // CHANGE
        
        scrollContentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(0)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
    }
    
    private func setupProducts() {
        let layout = UICollectionViewFlowLayout()
        productCollView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumLineSpacing = 20

        scrollContentView.addSubview(productCollView)

        productCollView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuse)
        productCollView.dataSource = self
        
        productCollView.backgroundColor = .cyan
        productCollView.isScrollEnabled = true
        productCollView.alwaysBounceVertical = true
        
        productCollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(55)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    
    }
    
    private func setupWebButton() {
        websiteButton.setTitle("Website".uppercased(), for: .normal)
        
        scrollContentView.addSubview(websiteButton)
        
        websiteButton.layer.cornerRadius = 5
        websiteButton.backgroundColor = .black
        websiteButton.setTitleColor(.white, for: .normal)
        websiteButton.setTitleColor(.white, for: .selected)
        websiteButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
//        websiteButton.addTarget(self, action: #selector(openWebsite), for: .touchUpInside)
        
        websiteButton.clipsToBounds = true
        websiteButton.isEnabled = true
        
        websiteButton.snp.makeConstraints { make in
            make.top.equalTo(productCollView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalTo(310)
        }
        
    }
    
    private func setupContactButton() {
        contactButton.setTitle("Contact".uppercased(), for: .normal)
        
        scrollContentView.addSubview(contactButton)
        contactButton.layer.cornerRadius = 5
        
        contactButton.addTarget(self, action: #selector(pushContactVC), for: .touchUpInside)
        
        contactButton.backgroundColor = .brown
        contactButton.setTitleColor(.white, for: .normal)
        contactButton.setTitleColor(.white, for: .selected)
        contactButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
        contactButton.isEnabled = true
        contactButton.clipsToBounds = true
        
        contactButton.snp.makeConstraints { make in
            make.top.equalTo(websiteButton.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalTo(310)
            make.bottom.equalToSuperview()
        }
        
    }
    
    
//    private func setupWebView(){
//        view.addSubview(webView)
//
//        let preferences = WKWebpagePreferences()
//        preferences.allowsContentJavaScript = true
//
//        let configuration = WKWebViewConfiguration()
//        configuration.defaultWebpagePreferences = preferences
//
//        webView = WKWebView(frame: view.bounds, configuration: configuration)
//        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        webView.allowsBackForwardNavigationGestures = true
//
//        webView.uiDelegate = self
//        webView.navigationDelegate = self
//
//        guard let url = URL(string: user.website) else { print("Error in ProductPageViewController: Invalid URL!"); return }
//        webView.load(URLRequest(url: url))
//    }
//
//    @objc private func openWebsite(){
//
//    }

    @objc private func pushContactVC(){
        let contactVC = ContactPageViewController(user: user)
        navigationController?.pushViewController(contactVC, animated: true)
    }

}

//extension ProductPageViewController: WKNavigationDelegate{}
//
//extension ProductPageViewController: WKUIDelegate {
//    //MARK: Creating new webView for popup
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        popupWebView = WKWebView(frame: view.bounds, configuration: configuration)
//        popupWebView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        popupWebView.navigationDelegate = self
//        popupWebView.uiDelegate = self
//        view.addSubview(popupWebView)
//        return popupWebView
//    }
//
//    //MARK: To close popup
//    func webViewDidClose(_ webView: WKWebView) {
//        if webView == popupWebView {
//            popupWebView.removeFromSuperview()
//            popupWebView = WKWebView()
//        }
//    }
//}


extension ProductPageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuse, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        let prod = user.products[indexPath.item]
        cell.configure(with: prod)
        return cell
    }
    

}

extension ProductPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: scrollContentView.frame.width, height: 300)
    }
}

