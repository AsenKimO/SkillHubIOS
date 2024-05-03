//
//  FilterPillCollectionViewCell.swift
//  SkillHub
//
//  Created by Library User on 5/3/24.
//

import UIKit
import SnapKit

class FilterPillCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties (view)
    var pill = UIButton()
    
    // MARK: - Properties (data)
    static let reuse: String = "FilterPillCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPill()
        contentView.backgroundColor = .white
    }
    
    private func setupPill(){
        contentView.addSubview(pill)
        
        pill.layer.cornerRadius = contentView.frame.height / 4
        pill.backgroundColor = .black
        pill.setTitleColor(.white, for: .normal)
        pill.setTitleColor(.white, for: .selected)
        pill.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        
        pill.isUserInteractionEnabled = false
        pill.clipsToBounds = true
        
        pill.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(filter: String, selected: Bool) {
        pill.setTitle(filter, for: .normal)
        pill.setTitle(filter, for: .selected)
        pill.backgroundColor = selected ? .black : .darkGray
        pill.isSelected = selected
    }
    
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
