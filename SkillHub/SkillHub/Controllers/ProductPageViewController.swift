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
    private var productTableView: UITableView!
    
    private var cblack = UIColor(red: 43/255, green: 48/255, blue: 58/255, alpha: 1)
    private var cbrown = UIColor(red: 86/255, green: 61/255, blue: 45/255, alpha: 1)
    private var cpink = UIColor(red: 205/255, green: 137/255, blue: 135/255, alpha: 1)
    private var offWhite = UIColor(red: 247/255, green: 243/255, blue: 227/255, alpha: 1)
    
    // MARK: - Properties (data)
    private let user: User
    
    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = offWhite
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(String(describing: productTableView.frame.width))
        print(productTableView.frame.height)
        DispatchQueue.main.async {
            self.productTableView.reloadData()
            self.productTableView.layoutIfNeeded()
        }
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
        
        scrollContentView.backgroundColor = offWhite
        scrollContentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.left.equalTo(scrollView.contentLayoutGuide.snp.left)
            make.right.equalTo(scrollView.contentLayoutGuide.snp.right)
//            make.height.equalTo(2500)
//            make.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
        }
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
        companyLabel.textColor = cpink
        companyLabel.numberOfLines = 0
        companyLabel.lineBreakMode = .byWordWrapping
        
        scrollContentView.addSubview(companyLabel)
        
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImage.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        companyLabel.setContentHuggingPriority(.required, for: .vertical)
    }

    private func setupTitleLabel() {
        titleLabel.text = user.title.uppercased()
        titleLabel.font = .systemFont(ofSize: 28, weight: .heavy)
        titleLabel.textColor = cblack
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping

        scrollContentView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private func setupProducts() {
        productTableView = UITableView(frame: .zero, style: .plain)

        scrollContentView.addSubview(productTableView)

        productTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.reuse)
        productTableView.delegate = self
        productTableView.dataSource = self
        
        productTableView.backgroundColor = .cyan
        
        productTableView.rowHeight = 130.0
        
        productTableView.isUserInteractionEnabled = false
        productTableView.isScrollEnabled = false
        productTableView.insetsContentViewsToSafeArea = true
        productTableView.isHidden = false
        
        productTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Float(productTableView.rowHeight) * Float(user.products.count))
        }
//        print(productTableView.visibleCells.count)
//        print("TableView: \(String(describing: productTableView))")
//        print(productTableView.frame)

    }
    
    private func setupWebButton() {
        websiteButton.setTitle("Website".uppercased(), for: .normal)
        
        scrollContentView.addSubview(websiteButton)
        
        websiteButton.layer.cornerRadius = 8
        websiteButton.backgroundColor = cpink
        websiteButton.setTitleColor(offWhite, for: .normal)
        websiteButton.setTitleColor(offWhite, for: .selected)
        websiteButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
//        websiteButton.addTarget(self, action: #selector(openWebsite), for: .touchUpInside)
        
        websiteButton.clipsToBounds = true
        websiteButton.isEnabled = true
        
        websiteButton.snp.makeConstraints { make in
            make.top.equalTo(productTableView.snp.bottom).offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
    }
    
    private func setupContactButton() {
        contactButton.setTitle("Contact".uppercased(), for: .normal)
        
        scrollContentView.addSubview(contactButton)
        contactButton.layer.cornerRadius = 8
        
        contactButton.addTarget(self, action: #selector(pushContactVC), for: .touchUpInside)
        
        contactButton.backgroundColor = .darkGray
        contactButton.setTitleColor(.white, for: .normal)
        contactButton.setTitleColor(.white, for: .selected)
        contactButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        
        contactButton.isEnabled = true
        contactButton.clipsToBounds = true
        
        contactButton.snp.makeConstraints { make in
            make.top.equalTo(websiteButton.snp.bottom).offset(12)
            make.height.equalTo(44)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
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

extension ProductPageViewController: UITableViewDelegate {}

extension ProductPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Rendering cell for row: \(indexPath.row)")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuse, for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        
        let prod = user.products[indexPath.item]
        cell.configure(product: prod)
        print(cell.frame)
        return cell
    }
}

