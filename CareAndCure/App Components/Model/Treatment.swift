//
//  Treatment.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 6/27/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import Foundation


// MARK: - TreatmentContainer
struct AllTreatmentContainer: Codable {
    let status: String?
    let data: [AllTreatment]?
    let code: Int?
}

// MARK: - Treatment
struct AllTreatment: Codable {
    let owner, slug, name, created: String?
    let lastUpdated, datumDescription, expireDate: String?
    let price: Int?
    let image: String?
    let quantity, city: Int?

    enum CodingKeys: String, CodingKey {
        case owner, slug, name, created
        case lastUpdated = "last_updated"
        case datumDescription = "description"
        case expireDate = "expire_date"
        case price, image, quantity, city
    }
    
    init(owner: String? = nil, slug: String? = nil, name: String? = nil ,created: String? = nil,lastUpdated: String? = nil, datumDescription: String? = nil, expireDate: String? = nil, price: Int? = nil, image: String? = nil, quantity: Int? = nil, city: Int? = nil) {
        self.owner = owner
        self.slug  = slug
        self.name  = name
        self.created = created
        self.lastUpdated = lastUpdated
        self.datumDescription = datumDescription
        self.expireDate = expireDate
        self.price = price
        self.image = image
        self.quantity = quantity
        self.city = city
    }
}


struct DetailsResponse : Codable {

        let code : Int?
        let data : TreatmentDetails?
        let status : String?

        


}

struct TreatmentDetails : Codable {

        let city : Int?
        let created : String?
        let descriptionField : String?
        let expireDate : String?
        let image : String?
        let lastUpdated : String?
        let name : String?
        let owner : String?
        let price : Int?
        let quantity : Int?
        let slug : String?

        

}

