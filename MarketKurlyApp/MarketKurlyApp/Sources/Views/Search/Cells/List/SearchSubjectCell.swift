//
//  SearchSubjectCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class SearchSubjectCell: UITableViewCell {
    
    let dummySearchWord = ["닭갈비","오틀리","블루베리","선물","하","ㅇㅁㄹㄴ"]
    
    // MARK: - Components
    @IBOutlet weak var searchTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func setUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        registerNib(cellNibName: "SearchWordCell", cellIdentifier: "searchWordCell")
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.collectionView.register(newCellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension SearchSubjectCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummySearchWord.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchWordCell", for: indexPath) as? SearchWordCell else {
            return UICollectionViewCell()
        }
        cell.searchLabel.text = dummySearchWord[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tmpLabel : UILabel = UILabel()
        tmpLabel.text = dummySearchWord[indexPath.item]
        let size = tmpLabel.frame.size
        return CGSize(width: size.width + 16, height: size.height + 10)
//        return CGSize(width: tmpLabel.intrinsicContentSize.width - 5, height: collectionView.frame.height)

    }
    
}

