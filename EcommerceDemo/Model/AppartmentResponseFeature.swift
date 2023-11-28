import Foundation
struct AppartmentFeature : Codable {
	let _id : String?
	let name : [String]?
	let price : Int?
	let item_taxes : [Int]?
	let specifications : [Specifications]?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case name = "name"
		case price = "price"
		case item_taxes = "item_taxes"
		case specifications = "specifications"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		name = try values.decodeIfPresent([String].self, forKey: .name)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
		item_taxes = try values.decodeIfPresent([Int].self, forKey: .item_taxes)
		specifications = try values.decodeIfPresent([Specifications].self, forKey: .specifications)
	}

}
