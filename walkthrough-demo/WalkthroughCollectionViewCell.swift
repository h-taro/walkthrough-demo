//
//  WalkthroughCollectionViewCell.swift
//  walkthrough-demo
//
//  Created by taro.hiraishi on 2023/06/06.
//

import UIKit
import SnapKit

class WalkthroughCollectionViewCell: UICollectionViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.width.height.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(text: String) {
        label.text = text
    }
}
