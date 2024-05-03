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
    private var collectionView = UICollectionView()
    
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
        
        setupFeaturedUser()
    }

    private func setupFeaturedUser(){
        
    }

}

