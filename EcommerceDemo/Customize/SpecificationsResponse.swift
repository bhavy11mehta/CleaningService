/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Specifications : Codable {
	let _id : String?
	let name : [String]?
	let sequence_number : Int?
	let unique_id : Int?
	var list : [List]?
	let max_range : Int?
	let range : Int?
	let type : Int?
	let is_required : Bool?
	let isParentAssociate : Bool?
    let modifierId : String?
    let modifierGroupId : String?
    let modifierGroupName : String?
    let modifierName : String?
    let isAssociated : Bool?
    let user_can_add_specification_quantity : Bool?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case name = "name"
		case sequence_number = "sequence_number"
		case unique_id = "unique_id"
		case list = "list"
		case max_range = "max_range"
		case range = "range"
		case type = "type"
		case is_required = "is_required"
		case isParentAssociate = "isParentAssociate"
        case modifierId = "modifierId"
        case modifierGroupId = "modifierGroupId"
        case modifierGroupName = "modifierGroupName"
        case modifierName = "modifierName"
        case isAssociated = "isAssociated"
        case user_can_add_specification_quantity = "user_can_add_specification_quantity"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		name = try values.decodeIfPresent([String].self, forKey: .name)
		sequence_number = try values.decodeIfPresent(Int.self, forKey: .sequence_number)
		unique_id = try values.decodeIfPresent(Int.self, forKey: .unique_id)
		list = try values.decodeIfPresent([List].self, forKey: .list)
		max_range = try values.decodeIfPresent(Int.self, forKey: .max_range)
		range = try values.decodeIfPresent(Int.self, forKey: .range)
		type = try values.decodeIfPresent(Int.self, forKey: .type)
		is_required = try values.decodeIfPresent(Bool.self, forKey: .is_required)
		isParentAssociate = try values.decodeIfPresent(Bool.self, forKey: .isParentAssociate)
        modifierId = try values.decodeIfPresent(String.self, forKey: .modifierId)
        modifierGroupId = try values.decodeIfPresent(String.self, forKey: .modifierGroupId)
        modifierGroupName = try values.decodeIfPresent(String.self, forKey: .modifierGroupName)
        modifierName = try values.decodeIfPresent(String.self, forKey: .modifierName)
        isAssociated = try values.decodeIfPresent(Bool.self, forKey: .isAssociated)
        user_can_add_specification_quantity = try values.decodeIfPresent(Bool.self, forKey: .user_can_add_specification_quantity)
	}

}
