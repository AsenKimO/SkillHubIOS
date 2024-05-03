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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        setupScrollView()
//        setupCollView()
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
        
        scrollContentView.backgroundColor = .white
        scrollContentView.snp.makeConstraints { make in
//            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
//            make.left.equalTo(scrollView.contentLayoutGuide.snp.left)
//            make.right.equalTo(scrollView.contentLayoutGuide.snp.right)
            make.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
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
        
        collView.delegate = self
        collView.dataSource = self

        collView.backgroundColor = .cyan
        collView.isScrollEnabled = true
        collView.alwaysBounceVertical = true
        collView.translatesAutoresizingMaskIntoConstraints = false
        
        collView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
        }
    }

}

extension AddProductViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 { return 10 }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
        } else {
            
        }
        return UICollectionViewCell()
    }
    

}

extension AddProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension AddProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 { return CGSize(width: 260, height: 32) }
        else if indexPath.section == 1 {
            
        } else {
            
        }
        return CGSize(width: 0, height: 0)
    }
}

