//
//  FirstController.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/16.
//

import UIKit

class FeedController: UICollectionViewController{
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helper
    func configureUI(){
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.className)
        collectionView.backgroundColor = .blue
    }
}

//MARK: - DataSource
extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.className, for: indexPath) as? FeedCell else { return UICollectionViewCell() }
        cell.backgroundColor = .red
        return cell
    }
}

//MARK: - FlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
}
