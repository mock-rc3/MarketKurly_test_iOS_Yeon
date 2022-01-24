//
//  CartDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/24.
//

import Alamofire

class CartDataManager {
    
    static let shared = CartDataManager()
    private init() {}
    
    // MARK: - 장바구니 생성
    func requestAddCart(userId:Int, para: AddCartRequest, completion: @escaping (AddCartResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/\(userId)/basket/v2"
        
        AF.request(URL, method: .post, parameters: para, encoder: JSONParameterEncoder() ).validate().responseDecodable(of:AddCartResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 1장바구니 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 장바구니 조회
    func requestShowCartList(userId:Int, completion: @escaping (ShowCartListResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/\(userId)/basket/v2"
        
        AF.request(URL, method: .get ).validate().responseDecodable(of:ShowCartListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 2장바구니 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 장바구니 삭제
    func requestDeleteCart(basketId:Int, completion: @escaping (DeleteCartResponse)->(Void)){
        let URL = "http://3.36.52.30:8081/basket/kurly/\(basketId)"
        
        AF.request(URL, method: .delete ).validate().responseDecodable(of:DeleteCartResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 3장바구니 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
}
