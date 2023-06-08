//
//  ViewController.swift
//  walkthrough-demo
//
//  Created by taro.hiraishi on 2023/06/06.
//

import UIKit

class ViewController: UIViewController {
    var texts: [String] = ["1", "2", "3"]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.itemSize = UIScreen.main.bounds.size
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.center.width.height.equalToSuperview()
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(WalkthroughCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: WalkthroughCollectionViewCell.self))
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return texts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: WalkthroughCollectionViewCell.self), for: indexPath) as! WalkthroughCollectionViewCell
        cell.setup(text: texts[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}
