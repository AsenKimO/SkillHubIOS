//
//  ViewController.swift
//  SkillHub
//
//  Created by Library User on 5/2/24.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {

    // MARK: - Properties (view)
    private var featuredUserView = UIView()
    private var filterButton = UIButton()
//    private var usersPageView = UIPageViewController()
//    private var collectionView = UICollectionView()
    
    // MARK: - Properties (data)
    private var users: [User] = []
    private var filteredUsers: [User] = []
    private var filters = ["All"]
    private var currFilter = 0
    
    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view = UIScrollView()
        setupFeaturedUser()
        setupFilterButton()
    }
    
    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // do any subview customizations AFTER autolayout
        customizeFeaturedUser()
        customizeFilterButton()
    }

    // MARK: - Featured user view setup
    private func setupFeaturedUser(){
        view.addSubview(featuredUserView)
        
        featuredUserView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalToSuperview().offset(44)
            make.right.equalToSuperview().offset(-44)
            make.height.equalTo(featuredUserView.snp.width)
        }
    }
    
    private func customizeFeaturedUser(){
        featuredUserView.backgroundColor = .blue
        featuredUserView.layer.cornerRadius = featuredUserView.frame.width / 10
        featuredUserView.layer.masksToBounds = true
    }
    
    //MARK: - Filter button setup
    private func setupFilterButton(){
        view.addSubview(filterButton)
        
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(featuredUserView.snp.bottom).offset(26)
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(65)
        }
    }
    
    private func customizeFilterButton(){
        filterButton.backgroundColor = .cyan
        filterButton.layer.cornerRadius = filterButton.frame.height / 4
        filterButton.layer.masksToBounds = true
    }
    
}
//
//extension HomePageViewController: UICollectionViewDataSource {
//
//}
//
//extension HomePageViewController: UICollectionViewDelegate {
//
//}
//
//extension HomePageViewController: UICollectionViewDelegateFlowLayout {
//
//}
