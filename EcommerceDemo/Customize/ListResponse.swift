

import Foundation
struct List : Codable {
    let _id : String?
    let name : [String]?
    let price : Int?
    let sequence_number : Int?
    var is_default_selected : Bool?
    let specification_group_id : String?
    let unique_id : Int?
    var specifications : [Specifications]
    var qty: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case _id = "_id"
        case name = "name"
        case price = "price"
        case sequence_number = "sequence_number"
        case is_default_selected = "is_default_selected"
        case specification_group_id = "specification_group_id"
        case unique_id = "unique_id"
        case specifications = "specifications"
        case qty = "qty"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        name = try values.decodeIfPresent([String].self, forKey: .name)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        sequence_number = try values.decodeIfPresent(Int.self, forKey: .sequence_number)
        is_default_selected = try values.decodeIfPresent(Bool.self, forKey: .is_default_selected) ?? false
        specification_group_id = try values.decodeIfPresent(String.self, forKey: .specification_group_id)
        unique_id = try values.decodeIfPresent(Int.self, forKey: .unique_id)
        specifications = try values.decodeIfPresent([Specifications].self, forKey: .specifications) ?? []
        qty = try values.decodeIfPresent(Int.self, forKey: .qty) ?? 0
    }
}
