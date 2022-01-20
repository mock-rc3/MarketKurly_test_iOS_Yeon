//
//  LevelDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//



import Alamofire

class CouponDataManager {
    
    static let shared = CouponDataManager()
    private init() {}
    
    // MARK: - 사용자 쿠폰 조회
    func requestUserCouponList(token:String,completion: @escaping (UserCouponListResponse)->(Void)){
        
        let URL = Constant.BasicURL + "coupon/user-coupon"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .get ,headers: HTTP_HEADERS ).validate().responseDecodable(of:UserCouponListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 네트워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 사용자 쿠폰 등록
    // 사용자 쿠폰 조회를 통해 데이터를 받아오고 테이블 reload, user거기에 수정
    func requestRegisterCoupon(userId:Int,couponId:Int,completion: @escaping (RegisterCouponResponse)->(Void)){
        let URL = Constant.BasicURL + "coupon/coupon/\(couponId)/user/\(userId)"
        AF.request(URL, method: .get ).validate().responseDecodable(of:RegisterCouponResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 네트워크 실패2: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 쿠폰 다운로드
    // /
    func requestDownloadCoupon(token:String, eventId:Int, completion: @escaping (DownloadCouponResponse)->(Void)){
        let URL = Constant.BasicURL + "event/\(eventId)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        AF.request(URL, method: .get ,headers: HTTP_HEADERS ).validate().responseDecodable(of:DownloadCouponResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 네트워크 실패2: ",error.localizedDescription)
            }
        }
    }
    
}
