//
//  ExcerciseModel.swift
//  Gymondo
//
//  Created by Nukala, Raja | RIEPL on 29/04/22.
//

import Foundation

struct ExercisesModel {
    
    struct Response {
        
        struct Exercises: Codable {
            let countOfObjects: Int?
            let next: String?
            let results: [Exercise]?
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                results = try values.decodeIfPresent([Exercise].self, forKey: .results)
                countOfObjects = try values.decodeIfPresent(Int.self, forKey: .countOfObjects) ?? nil
                next = try values.decodeIfPresent(String.self, forKey: .next) ?? nil
            }
            
            struct Exercise: Codable {
                let id: Int?
                let uuid, name: String?
                let exerciseBase: Int?
                let resultDescription: String?
                let creationDate: String?
                let category: Int?
                let muscles, musclesSecondary, equipment: [Int]?
                let language, license: Int?
                let licenseAuthor: String?
                let variations: [Int]?
                
                enum CodingKeys: String, CodingKey {
                    case id = "id"
                    case uuid = "uuid"
                    case name = "name"
                    case exerciseBase = "exercise_base"
                    case resultDescription = "description"
                    case creationDate = "creation_date"
                    case category = "category"
                    case muscles = "muscles"
                    case musclesSecondary = "muscles_secondary"
                    case equipment = "equipment"
                    case language = "language"
                    case license = "license"
                    case licenseAuthor = "license_author"
                    case variations = "variations"
                }
                
                init(from decoder: Decoder) throws {
                    let values = try decoder.container(keyedBy: CodingKeys.self)
                    id = try values.decodeIfPresent(Int.self, forKey: .id) ?? nil
                    uuid = try values.decodeIfPresent(String.self, forKey: .uuid) ?? nil
                    name = try values.decodeIfPresent(String.self, forKey: .name) ?? nil
                    exerciseBase = try values.decodeIfPresent(Int.self, forKey: .exerciseBase) ?? nil
                    resultDescription = try values.decodeIfPresent(String.self, forKey: .resultDescription) ?? nil
                    creationDate = try values.decodeIfPresent(String.self, forKey: .creationDate) ?? nil
                    category = try values.decodeIfPresent(Int.self, forKey: .category) ?? nil
                    muscles = try values.decodeIfPresent([Int].self, forKey: .muscles) ?? nil
                    musclesSecondary = try values.decodeIfPresent([Int].self, forKey: .musclesSecondary) ?? nil
                    equipment = try values.decodeIfPresent([Int].self, forKey: .equipment) ?? nil
                    language = try values.decodeIfPresent(Int.self, forKey: .language) ?? nil
                    license = try values.decodeIfPresent(Int.self, forKey: .license) ?? nil
                    licenseAuthor = try values.decodeIfPresent(String.self, forKey: .licenseAuthor) ?? nil
                    variations = try values.decodeIfPresent([Int].self, forKey: .variations) ?? nil
                    
                }
            }
        }
    }
}


/*
 
 struct CouponsModel {
 
 struct Request {
 let id: Int?
 let size: Int?
 let cursor: Int?
 }
 
 struct Response {
 struct Couopns: Codable {
 let coupon: [Coupon]?
 let cursor: Int?
 
 enum CodingKeys: String, CodingKey {
 case coupon = "coupons"
 case cursor = "cursor"
 }
 
 init(from decoder: Decoder) throws {
 let values = try decoder.container(keyedBy: CodingKeys.self)
 coupon = try values.decodeIfPresent([Coupon].self, forKey: .coupon) ?? nil
 cursor = try values.decodeIfPresent(Int.self, forKey: .cursor) ?? nil
 }
 }
 enum CouponType: Int, Codable {
 case REGULAR = 0
 case NEW = 1
 case COMINGSOON = 2
 }
 
 struct Coupon: Codable {
 let id: Int?
 let type: String?
 let title: String?
 let timestamp: String?
 let terms: String?
 let preview: String?
 let point: Int?
 var couponType: CouponType
 
 enum CodingKeys: String, CodingKey {
 case id = "id"
 case type = "type"
 case title = "title"
 case timestamp = "timestamp"
 case terms = "terms"
 case preview = "preview"
 case point = "point"
 case couponType = "coupon_type"
 }
 
 init(from decoder: Decoder) throws {
 let values = try decoder.container(keyedBy: CodingKeys.self)
 id = try values.decodeIfPresent(Int.self, forKey: .id) ?? nil
 type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
 title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
 timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp) ?? ""
 terms = try values.decodeIfPresent(String.self, forKey: .terms) ?? ""
 preview = try values.decodeIfPresent(String.self, forKey: .preview) ?? nil
 point = try values.decodeIfPresent(Int.self, forKey: .point) ?? 0
 couponType = try values.decodeIfPresent(CouponType.self, forKey: .couponType) ?? .REGULAR
 }
 }
 }
 }
 
 */