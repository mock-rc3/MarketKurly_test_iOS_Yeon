//
//  MyCouponListViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

class MyCouponListViewController: UIViewController {
    
    let userInfoManager = UserInfoManaer.shared
    let couponDataManager = CouponDataManager.shared
    var myCouponList: [UserCouponListDocument] = []
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCouponBtn: UIButton!
    @IBAction func addCouponTapped(_ sender: Any) {
        // TODO: - 알림창 커스텀해야됨 - 못할듯
        presentTextFieldAlert()
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCouponList()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    // MARK: - Functions
    func setUI(){
        customButton(addCouponBtn, cornerValue: 5, btnBorderColor: UIColor.mainKurlyPurple, btnBorderWidth: 1)
        dismissKeyboardWhenTappedAround()
        naviTitleDelete(navi: self.navigationController!)
        customNavigationBarAttribute(.white, .black)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 텍스트필드가 포함된 UIAlertController
    func presentTextFieldAlert( preferredStyle style: UIAlertController.Style = .alert,
                      handler: ((UIAlertAction) -> Void)? = nil) {
        self.dismissIndicator()
        let alert = UIAlertController(title: "쿠폰 등록", message: nil, preferredStyle: style)
        alert.addTextField { couponTextField in
            couponTextField.placeholder = "발급된 쿠폰번호를 입력해 주세요"
            couponTextField.layer.cornerRadius = 5
        }
        let actionDone = UIAlertAction(title: "확인", style: .default) { (ok) in
            // TODO: 쿠폰 API 해야됨
            guard let couponIdString = alert.textFields?[0].text else {
                return
            }
            let couponIdInt: Int = Int(couponIdString) ?? -1
            if couponIdInt != -1 {
                self.couponDataManager.requestRegisterCoupon(userId: self.userInfoManager.getUid(), couponId: couponIdInt) { response in
                    print("ww111",response)
                    self.couponDataManager.requestUserCouponList(token: UserDefaults.standard.string(forKey: Constant.jwtName)!) { response in
                        self.userInfoManager.setUserCouponInfo(response.result!)
                        self.myCouponList = response.result!
                        self.tableView.reloadData()
                    }
                    self.presentAlert(title: response.result)
                    
                }
            }
    
        }
        alert.addAction(actionDone)
            let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    /* API 통신하는 부분 */
    func loadCouponList(){
        guard let couponList = userInfoManager.getUserCouponInfo() else {
            return
        }
        myCouponList = couponList
        tableView.reloadData()
        
    }
    
}

extension MyCouponListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCouponList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "couponCell", for: indexPath) as? CouponCell else {
            return UITableViewCell()
        }
        
        let target = myCouponList[indexPath.row]
        cell.discountLabel.text = "\(DecimalWon(value: Int(target.getCouponDiscount() ) )) 할인"
        cell.nameLabel.text = target.getCouponName()
        cell.contentLabel.text = target.getCouponDescription()
        cell.dateLabel.text = getFormattedDate(dateString: target.getCouponExpiredDate())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}

class CouponCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
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
        
    }
}
