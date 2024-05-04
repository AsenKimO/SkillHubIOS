//
//  AddProductViewController.swift
//  SkillHub
//
//  Created by Asen Ou on 5/2/24.
//

import UIKit

class AddProductViewController: UIViewController {
    
    private var collView: UICollectionView!
    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    private var titleView = UILabel()
    
    private var cblack = UIColor(red: 43/255, green: 48/255, blue: 58/255, alpha: 1)
    private var clbrown = UIColor(red: 232/255, green: 203/255, blue: 180/255, alpha: 1)
    private var offwhite = UIColor(red: 247/255, green: 243/255, blue: 227/255, alpha: 1)
    private var cpink = UIColor(red: 205/255, green: 137/255, blue: 135/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = offwhite
        setupNavBar()
        setupScrollView()
        setupTitle()
        setupCollView()
    }
    
    private func setupNavBar(){
        navigationController?.navigationBar.isHidden = false
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
        
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "bag"), style: .plain, target: self, action: #selector(placeholder))
        cartButton.tintColor = .white
        navigationItem.rightBarButtonItems = [cartButton]
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.layoutMargins.left = 36
    }
    
    private func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
        }
        scrollView.contentLayoutGuide.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(scrollContentView)
        
        scrollContentView.backgroundColor = offwhite
        scrollContentView.snp.makeConstraints { make in
//            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
//            make.left.equalTo(scrollView.contentLayoutGuide.snp.left)
//            make.right.equalTo(scrollView.contentLayoutGuide.snp.right)
            make.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
        }
        
    }
    
    private func setupTitle(){
        scrollContentView.addSubview(titleView)
        titleView.text = "Add Business & Products"
        titleView.font = .systemFont(ofSize: 24, weight: .regular)
        
        titleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    private func setupCollView(){
        let layout = UICollectionViewFlowLayout()
        collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        
        scrollContentView.addSubview(collView)
        
//        collView.register(AddPageBusinessCollectionViewCell.self, forCellWithReuseIdentifier: AddPageBusinessCollectionViewCell.reuse)
//        collView.register(AddPageProdCollectionViewCell.self, forCellWithReuseIdentifier: AddPageProdCollectionViewCell.reuse)
        
//        collView.delegate = self
//        collView.dataSource = self

        collView.backgroundColor = offwhite
        collView.isScrollEnabled = true
        collView.alwaysBounceVertical = true
        collView.translatesAutoresizingMaskIntoConstraints = false
        
        collView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(33)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func pushAddProductPage(){
        let addProdVC = AddProductViewController()
        navigationController?.pushViewController(addProdVC, animated: true)
    }
    
    @objc private func placeholder(){}

}

//extension AddProductViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if section == 0 { return 1 }
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.section == 0 {
//            
//        } else {
//            
//        }
//        return UICollectionViewCell()
//    }
//    
//
//}
//
//extension AddProductViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    }
//}
//
//extension AddProductViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.section == 0 { return CGSize(width: 260, height: 32) }
//        else if indexPath.section == 1 {
//            
//        } else {
//            
//        }
//        return CGSize(width: 0, height: 0)
//    }
//}

