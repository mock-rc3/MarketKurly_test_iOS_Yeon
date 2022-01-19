//
//  UserManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit

class UserInfoManaer {
    static let shared = UserInfoManaer()
    
    private init() {}
    
    // 사용자 레벨
    var userLevelInfo: SelectLevelDocument?
    
    func setUserLevelInfo(_ info: SelectLevelDocument) {
        self.userLevelInfo = info
    }
    
    func getUserLevelInfo() -> SelectLevelDocument? {
        guard let userLevelInfo = self.userLevelInfo else { return nil }
        return userLevelInfo
    }
    
    
    func getLevelId() -> Int {
        guard let levelId = self.userLevelInfo?.getLevelId() else { return 100 }
        
        return levelId
    }
    
    func getLevelName() -> String {
        guard let levelName = self.userLevelInfo?.getLevelName() else { return "" }
        
        return levelName
    }
    
    func getLevelPointsRate() -> Double {
        guard let levelPointsRate = self.userLevelInfo?.getLevelPointsRate() else { return 100 }
        
        return levelPointsRate
    }
    
    
    // UserDataManager의 UserDocument 부분
    var userInfo: UserDocument?
    
    func setUserInfo(_ info: UserDocument) {
        self.userInfo = info
    }
    
    func getUserInfo() -> UserDocument? {
        guard let userInfo = self.userInfo else { return nil }
        return userInfo
    }
    
    func getUid() -> Int {
        guard let uid = self.userInfo?.getUid() else { return 0 }
        
        return uid
    }
    
    func setUid(_ uid: Int){
        userInfo?.setUid(uid)
    }
    
    func getUserId() -> String {
        guard let id = self.userInfo?.getUserId() else { return ""
        }
        return id
    }
    
    func setUserId(_ id: String){
        userInfo?.setUserId(id)
    }
    
    func getUserName() -> String {
        guard let name = self.userInfo?.getUserName() else { return ""
        }
        return name
    }
    
    func setUserName(_ name: String){
        userInfo?.setUserName(name)
    }
    
    func getUserPwd() -> String {
        guard let pwd = self.userInfo?.getUserPwd() else { return ""
        }
        return pwd
    }
    
    func setUserPwd(_ pwd: String){
        userInfo?.setUserPwd(pwd)
    }
    
    func getUserEmail() -> String {
        guard let email = self.userInfo?.getUserEmail() else { return ""
        }
        return email
    }
    
    func setUserEmail(_ email: String){
        userInfo?.setUserEmail(email)
    }
    
    func getUserPhone() -> String {
        guard let phone = self.userInfo?.getUserPhone() else { return ""
        }
        return phone
    }
    
    func setUserPhone(_ phone: String){
        userInfo?.setUserPhone(phone)
    }
    
    func getUserBirthDay() -> String {
        guard let birthDay = self.userInfo?.getUserBirth() else { return ""
        }
        return birthDay
    }
    
    func setUserBirth(_ birthDay: String){
        userInfo?.setUserBirth(birthDay)
    }
    
   
    func getUserCreatedAt() -> String {
        guard let createdAt = self.userInfo?.getUserCreatedAt() else { return ""
        }
        return createdAt
    }
    
    func setUserCreatedAt(_ createdAt: String){
        userInfo?.setUserCreatedAt(createdAt)
    }
    
    func getUserGender() -> String {
        guard let gender = self.userInfo?.getUserGender() else { return ""
        }
        return gender
    }
    
    func setUserGender(_ gender: String){
        userInfo?.setUserGender(gender)
    }
    
    func getUserLevel() -> Int {
        guard let level = self.userInfo?.getUserLevel() else { return 0 }
        
        return level
    }
    
    func setUserLevel(_ level: Int){
        userInfo?.setUserLevel(level)
    }
    
    func getUserPoint() -> Int {
        guard let point = self.userInfo?.getUserPoint() else { return 0 }
        
        return point
    }
    
    func setUserPoint(_ point: Int){
        userInfo?.setUserPoint(point)
    }
    
    

}

// assert(false,"실패")
