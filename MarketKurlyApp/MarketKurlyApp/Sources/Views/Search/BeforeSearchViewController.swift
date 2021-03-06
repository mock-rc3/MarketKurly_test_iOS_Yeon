//
//  BeforeSearchViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class BeforeSearchViewController: UIViewController {

    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        registerNib(cellNibName: "SearchSubjectCell", cellIdentifier: "searchSubjectCell")
        registerNib(cellNibName: "SearchEventFrameCell", cellIdentifier: "searchEventFrameCell")
        registerNib(cellNibName: "SearchSubject3Cell", cellIdentifier: "searchSubject3Cell")
        registerNib(cellNibName: "SearchSubject4Cell", cellIdentifier: "searchSubject4Cell")
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }

}

extension BeforeSearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchSubjectCell", for: indexPath) as? SearchSubjectCell else {
                return UITableViewCell()
            }
            cell.searchTitle.text = "검색어 주제"
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchEventFrameCell", for: indexPath) as? SearchEventFrameCell else {
                return UITableViewCell()
            }
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchSubject3Cell", for: indexPath) as? SearchSubject3Cell else {
                return UITableViewCell()
            }
            return cell
        case 3 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchSubject4Cell", for: indexPath) as? SearchSubject4Cell else {
                return UITableViewCell()
            }
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 100
        case 1,2 :
            return 150
        case 3 :
            return 530
        default :
            return 0
        }
    }
    
}
