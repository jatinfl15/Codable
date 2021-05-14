import Foundation

struct Response : Codable {

        let data : [Datum]?

        enum CodingKeys: String, CodingKey {
                case data = "data"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                data = try values.decodeIfPresent([Datum].self, forKey: .data)
        }

}

struct Datum : Codable {

        let data : Datum1?

        enum CodingKeys: String, CodingKey {
                case data = "data"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                data = Datum1(from: decoder)
        }

}


struct Datum1 : Codable {

        let attributes : Attribute?
        let id : Int?
        let relationships : Relationship?

        enum CodingKeys: String, CodingKey {
                case attributes = "attributes"
                case id = "id"
                case relationships = "relationships"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                attributes = Attribute(from: decoder)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                relationships = Relationship(from: decoder)
        }

}

struct Attribute : Codable {

        let name : String?

        enum CodingKeys: String, CodingKey {
                case name = "name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                name = try values.decodeIfPresent(String.self, forKey: .name)
        }

}

struct Relationship : Codable {

        let photo : Photo?

        enum CodingKeys: String, CodingKey {
                case photo = "photo"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                photo = Photo(from: decoder)
        }

}

struct Photo : Codable {

        let data : Datum2?

        enum CodingKeys: String, CodingKey {
                case data = "data"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                data = Datum2(from: decoder)
        }

}

struct Datum2 : Codable {

        let attributes : Attribute2?
        let id : Int?

        enum CodingKeys: String, CodingKey {
                case attributes = "attributes"
                case id = "id"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                attributes = Attribute2(from: decoder)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
        }

}

struct Attribute2 : Codable {

        let url : String?

        enum CodingKeys: String, CodingKey {
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
