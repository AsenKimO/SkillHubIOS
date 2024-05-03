//
//  ViewController.swift
//  SkillHub
//
//  Created by Asen Ou on 5/2/24.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {

    // MARK: - Properties (view)
    private var featuredUserView = UIView()
    private var filterButton = UIButton()
    private var pillCollView: UICollectionView!
    private var collectionView: UICollectionView!
    
    // MARK: - Properties (data)
    private var users: [User] = []
    private var filteredUsers: [User] = []
    private var filters = ["All", "a", "b", "c"]
    private var currFilter = 0
    
    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupFilterPills()
        setupCollectionView()
    }
    
    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // do any subview customizations AFTER autolayout
    }
    // MARK: - Collection view setup
    private func setupFilterPills(){
        let layout = UICollectionViewFlowLayout()
        pillCollView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        
        view.addSubview(pillCollView)
        
        pillCollView.register(FilterPillCollectionViewCell.self, forCellWithReuseIdentifier: FilterPillCollectionViewCell.reuse)
        pillCollView.delegate = self
        pillCollView.dataSource = self
        
        pillCollView.backgroundColor = .cyan
        pillCollView.isScrollEnabled = true
        pillCollView.alwaysBounceHorizontal = true
        pillCollView.isUserInteractionEnabled = true
        pillCollView.isMultipleTouchEnabled = true
        pillCollView.showsHorizontalScrollIndicator = false
        
        pillCollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(26)
            make.left.equalTo(view.snp.left).offset(36)
            make.right.equalTo(view.snp.right).offset(-36)
            make.height.equalTo(33)
        }
    }
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        
        view.addSubview(collectionView)
        
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(loadUsers), for: .valueChanged)
        collectionView.refreshControl = refreshControl

        collectionView.backgroundColor = .cyan
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(pillCollView.snp.bottom).offset(36)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(36)
            make.right.equalToSuperview().offset(-36)
        }
    }
    
    // MARK: - actions
    @objc private func loadUsers(){
//        NetworkManager.shared.fetchRecipes(){ [weak self] recipes in
//            guard let self = self else { return }
//            self.recipes = recipes
//            let filt = filters[currFilter]
//            self.filteredRecipes = recipes.filter({ filt == "All" || ($0.difficulty == filt) })
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//                self.refreshControl.endRefreshing()
//            }
//        }
    }
}

extension HomePageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pillCollView { return filters.count }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == pillCollView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPillCollectionViewCell.reuse, for: indexPath) as? FilterPillCollectionViewCell else { return UICollectionViewCell() }
            
            let filt = filters[indexPath.item]
            cell.configure(filter: filt, selected: (indexPath.item == currFilter))
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.reuse, for: indexPath) as? UserCollectionViewCell else { return UICollectionViewCell() }
        
//        let user = users[indexPath.item]
        let user = User(id: 0, name: "a", email: "b", website: "c", image_url: "", products: [])
        cell.configure(with: user)
        return cell
    }
    

}

//extension HomePageViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
//}

extension HomePageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == pillCollView { return CGSize(width: 116, height: 32) }
        else {
            if indexPath.item == 0 {
                let collViewWidth = collectionView.frame.width
                return CGSize(width: collViewWidth, height: collViewWidth)
            }
            return CGSize(width: 150, height: 150)
        }
    }
}
