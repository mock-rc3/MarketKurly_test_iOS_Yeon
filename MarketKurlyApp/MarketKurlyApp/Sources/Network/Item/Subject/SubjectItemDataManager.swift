//
//  SubjectItemDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

import Alamofire

class SubjectItemDataManager {
    
    static let shared = SubjectItemDataManager()
    private init() {}
    
    // 주제 리스트 조회
    func requestSubjectList(completion: @escaping (AllSubjectResponse)->(Void)){
        let URL = Constant.BasicURL2 + "subject/all"
        AF.request(URL, method: .get).validate().responseDecodable(of:AllSubjectResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    // 주제의 아이템들 조회
    func requestSubjectItems(subjectId: Int,completion: @escaping (SubjectItemesResponse)->(Void)){
        let URL = Constant.BasicURL2 + "subject?id=\(subjectId)"
        
        AF.request(URL, method: .get).validate().responseDecodable(of:SubjectItemesResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print("문제잇니?",error.localizedDescription)
            }
        }
    }
    
}


