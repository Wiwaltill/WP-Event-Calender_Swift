//
//  Events.swift
//  WP-Event-Calender_Example
//
//  Created by Wiwaltill on 23.07.22.
//

import Foundation

// MARK: - Events
struct Events: Codable {
    let events: [Event]
    let restURL: String
    let nextRESTURL: String?
    let total: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case events = "events"
        case restURL = "rest_url"
        case nextRESTURL = "next_rest_url"
        case total = "total"
        case totalPages = "total_pages"
    }
}

// MARK: - Event
struct Event: Codable {
    let id: Int
    let globalID: String
    let globalIDLineage: [String]
    let author: String
    let status: String
    let date: String
    let dateUTC: String
    let modified: String
    let modifiedUTC: String
    let url: String
    let restURL: String
    let title: String
    let eventDescription: String
    let excerpt: String
    let slug: String
    let image: Bool
    let allDay: Bool
    let startDate: String
    let startDateDetails: DateDetails
    let endDate: String
    let endDateDetails: DateDetails
    let utcStartDate: String
    let utcStartDateDetails: DateDetails
    let utcEndDate: String
    let utcEndDateDetails: DateDetails
    let timezone: String
    let timezoneAbbr: String
    let cost: String
    let costDetails: CostDetails
    let website: String
    let showMap: Bool
    let showMapLink: Bool
    let hideFromListings: Bool
    let sticky: Bool
    let featured: Bool
    let categories: [JSONAny]
    let tags: [JSONAny]
    let venue: Venue
    let organizer: [Organizer]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case globalID = "global_id"
        case globalIDLineage = "global_id_lineage"
        case author = "author"
        case status = "status"
        case date = "date"
        case dateUTC = "date_utc"
        case modified = "modified"
        case modifiedUTC = "modified_utc"
        case url = "url"
        case restURL = "rest_url"
        case title = "title"
        case eventDescription = "description"
        case excerpt = "excerpt"
        case slug = "slug"
        case image = "image"
        case allDay = "all_day"
        case startDate = "start_date"
        case startDateDetails = "start_date_details"
        case endDate = "end_date"
        case endDateDetails = "end_date_details"
        case utcStartDate = "utc_start_date"
        case utcStartDateDetails = "utc_start_date_details"
        case utcEndDate = "utc_end_date"
        case utcEndDateDetails = "utc_end_date_details"
        case timezone = "timezone"
        case timezoneAbbr = "timezone_abbr"
        case cost = "cost"
        case costDetails = "cost_details"
        case website = "website"
        case showMap = "show_map"
        case showMapLink = "show_map_link"
        case hideFromListings = "hide_from_listings"
        case sticky = "sticky"
        case featured = "featured"
        case categories = "categories"
        case tags = "tags"
        case venue = "venue"
        case organizer = "organizer"
    }
}

// MARK: - CostDetails
struct CostDetails: Codable {
    let currencySymbol: String
    let currencyCode: String
    let currencyPosition: String
    let values: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case currencySymbol = "currency_symbol"
        case currencyCode = "currency_code"
        case currencyPosition = "currency_position"
        case values = "values"
    }
}

// MARK: - DateDetails
struct DateDetails: Codable {
    let year: String
    let month: String
    let day: String
    let hour: String
    let minutes: String
    let seconds: String

    enum CodingKeys: String, CodingKey {
        case year = "year"
        case month = "month"
        case day = "day"
        case hour = "hour"
        case minutes = "minutes"
        case seconds = "seconds"
    }
}

// MARK: - Organizer
struct Organizer: Codable {
    let id: Int
    let author: String
    let status: String
    let date: String
    let dateUTC: String
    let modified: String
    let modifiedUTC: String
    let url: String
    let organizer: String
    let slug: String
    let globalID: String
    let globalIDLineage: [String]
    let phone: String?
    let website: String?
    let email: String?
    let organizerDescription: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case status = "status"
        case date = "date"
        case dateUTC = "date_utc"
        case modified = "modified"
        case modifiedUTC = "modified_utc"
        case url = "url"
        case organizer = "organizer"
        case slug = "slug"
        case globalID = "global_id"
        case globalIDLineage = "global_id_lineage"
        case phone = "phone"
        case website = "website"
        case email = "email"
        case organizerDescription = "description"
    }
}

// MARK: - Venue
struct Venue: Codable {
    let id: Int
    let author: String
    let status: String
    let date: String
    let dateUTC: String
    let modified: String
    let modifiedUTC: String
    let url: String
    let venue: String
    let slug: String
    let city: String
    let country: String
    let province: String
    let zip: String
    let stateprovince: String
    let showMap: Bool
    let showMapLink: Bool
    let globalID: String
    let globalIDLineage: [String]
    let address: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case status = "status"
        case date = "date"
        case dateUTC = "date_utc"
        case modified = "modified"
        case modifiedUTC = "modified_utc"
        case url = "url"
        case venue = "venue"
        case slug = "slug"
        case city = "city"
        case country = "country"
        case province = "province"
        case zip = "zip"
        case stateprovince = "stateprovince"
        case showMap = "show_map"
        case showMapLink = "show_map_link"
        case globalID = "global_id"
        case globalIDLineage = "global_id_lineage"
        case address = "address"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func eventsTask(with url: URL, completionHandler: @escaping (Events?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
