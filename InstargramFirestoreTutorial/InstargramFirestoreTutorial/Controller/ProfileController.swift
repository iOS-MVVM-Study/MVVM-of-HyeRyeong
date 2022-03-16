//
//  ProfileController.swift
//  InstargramFirestoreTutorial
//
//  Created by 장혜령 on 2022/02/16.
//

import UIKit

class ProfileController: UICollectionViewController{
    
    // MARK: - Properties
    var user: User? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        configureCollectionView()
        fetchUser()
    }
    
    // MARK: - API
    
    func fetchUser() {
        UserService.fetchUser { user in
            self.user = user
            self.navigationItem.title = user.userName
        }
    }
    
    // MARK: - Helper
 
    func configureCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.className)
        collectionView.register(ProfileHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: ProfileHeader.className)
    }
    
}

// MARK: - UICollectionViewDataSource
extension ProfileController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.className, for: indexPath) as? ProfileCell else {return UICollectionViewCell()}
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        print("DEBUG: Did call header function")
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeader.className, for: indexPath) as? ProfileHeader else { return UICollectionReusableView()}
        
        if let user = user {
            header.viewModel = ProfileHeaderViewModel(user: user)
        } else {
            print("DEBUG: User not yet set ...")
        }
        return header
    }
}


// MARK: - UICollectionViewDelegate
extension ProfileController{
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}
