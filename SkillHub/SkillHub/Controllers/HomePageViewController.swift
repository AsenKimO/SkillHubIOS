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
    
    private var cblack = UIColor(red: 43/255, green: 48/255, blue: 58/255, alpha: 1)
    private var clbrown = UIColor(red: 232/255, green: 203/255, blue: 180/255, alpha: 1)
    private var offwhite = UIColor(red: 247/255, green: 243/255, blue: 227/255, alpha: 1)
    private var cpink = UIColor(red: 205/255, green: 137/255, blue: 135/255, alpha: 1)
    
    
    // MARK: - Properties (data)
    private var users: [User] = DummyData().dummyUsers
    private var filteredUsers: [User] = DummyData().dummyUsers
    private var filters = ["All", "Popular", "Companies", "Freelance"]
    private var currFilter = 0
    
    // MARK: - View Cycles
    private let refreshControl = UIRefreshControl()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = offwhite
        
        
        setupNavBar()
        setupFilterPills()
        setupCollectionView()
    }
    
    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // do any subview customizations AFTER autolayout
    }
    // MARK: - navbar setup
    private func setupNavBar(){
        
        let skillString = NSAttributedString(string: "skill", attributes: [NSAttributedString.Key.foregroundColor: cblack, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 35)!])
        let hubString = NSAttributedString(string: "Hub", attributes: [NSAttributedString.Key.foregroundColor: offwhite, NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 35)!])
        
        
        // Combine the attributed strings
        let combinedString = NSMutableAttributedString()
        combinedString.append(skillString)
        combinedString.append(hubString)
        
        navigationItem.title = ""
            navigationController?.navigationBar.topItem?.titleView = UILabel()
            navigationController?.navigationBar.topItem?.titleView?.alpha = 0 // Hide the default title view
            navigationController?.navigationBar.topItem?.titleView?.layer.opacity = 0 // Hide the default title view
            navigationController?.navigationBar.topItem?.titleView?.backgroundColor = .clear // Hide the default title view
            navigationController?.navigationBar.topItem?.titleView = UILabel()
            navigationController?.navigationBar.topItem?.titleView?.alpha = 1 // Hide the default title view
            navigationController?.navigationBar.topItem?.titleView?.layer.opacity = 1 // Hide the default title view
            navigationController?.navigationBar.topItem?.titleView?.backgroundColor = .clear // Hide the default title view
            navigationController?.navigationBar.topItem?.titleView?.tintColor = .black // Set the text color
            navigationController?.navigationBar.topItem?.titleView?.layer.masksToBounds = true // Set the text color
            navigationController?.navigationBar.topItem?.titleView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Set the text color
        
        (navigationController?.navigationBar.topItem?.titleView as? UILabel)?.attributedText = combinedString
            
    
//        navigationItem.title = "skillHub"
        let appearance = UINavigationBarAppearance()
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 35)!]
        appearance.titleTextAttributes = attributes
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = cpink
        
        let backItemAppearance = UIBarButtonItemAppearance()
        backItemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white]
        appearance.backButtonAppearance = backItemAppearance
         
        let image = UIImage(systemName: "chevron.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        appearance.setBackIndicatorImage(image, transitionMaskImage: image)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(pushAddProductPage))
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "bag"), style: .plain, target: self, action: #selector(placeholder))
        addButton.tintColor = .white
        cartButton.tintColor = .white
        navigationItem.rightBarButtonItems = [cartButton, addButton]
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.layoutMargins.left = 36
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
        
        pillCollView.backgroundColor = UIColor(red: 247/255, green: 243/255, blue: 227/255, alpha: 1)
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
        
        collectionView.register(FeatUserCollectionViewCell.self, forCellWithReuseIdentifier: FeatUserCollectionViewCell.reuse)
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(loadUsers), for: .valueChanged)
        collectionView.refreshControl = refreshControl

        collectionView.backgroundColor = UIColor(red: 247/255, green: 243/255, blue: 227/255, alpha: 1)
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(pillCollView.snp.bottom).offset(36)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(36)
            make.right.equalToSuperview().offset(-36)
        }
    }
    
    // MARK: - actions
    @objc private func loadUsers(){
        self.collectionView.reloadData()
        self.refreshControl.endRefreshing()
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
    
    @objc private func pushAddProductPage(){
        let addProdVC = AddProductViewController()
        navigationController?.pushViewController(addProdVC, animated: true)
    }
    
    @objc private func placeholder(){}
}

extension HomePageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == pillCollView { return filters.count }
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let user = users[indexPath.item]
        
        if collectionView == pillCollView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPillCollectionViewCell.reuse, for: indexPath) as? FilterPillCollectionViewCell else { return UICollectionViewCell() }
            
            let filt = filters[indexPath.item]
            cell.configure(filter: filt, selected: (indexPath.item == currFilter))
            return cell
        }
        
        if indexPath.item == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeatUserCollectionViewCell.reuse, for: indexPath) as? FeatUserCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: user)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.reuse, for: indexPath) as? UserCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: user)
            return cell
        }
        
    }
    

}

extension HomePageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == pillCollView {
            currFilter = indexPath.item
            pillCollView.reloadData()
            self.collectionView.reloadData()
        }
        else {
            let user = users[indexPath.item]
//            let user = User(name: "name", title: "FA23 MOVE IN", email: "email", website: "website", image_url: "", products: [])
            let productPageVC = ProductPageViewController(user: user)
            navigationController?.pushViewController(productPageVC, animated: true)
        }
    }
}

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
