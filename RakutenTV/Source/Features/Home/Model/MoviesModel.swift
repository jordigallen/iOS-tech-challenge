//
//  Movies.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 31/3/21.
//

import Foundation

struct MoviesModel: Codable {
    // MARK: - Initial
    let data: DataClass


    // MARK: - DataClass
    struct DataClass: Codable {
        let type, id: String
        let numericalID: Int
        let category: JSONNull?
        let shortName, contentType: String
        let isB2B: Bool
        let wktvCode: JSONNull?
        let onlyCoupon, isRecommendation: Bool
        let name: String
        let additionalImages: AdditionalImages
        let kind: String
        let contents: Contents

        enum CodingKeys: String, CodingKey {
            case type, id
            case numericalID = "numerical_id"
            case category
            case shortName = "short_name"
            case contentType = "content_type"
            case isB2B = "is_b2b"
            case wktvCode = "wktv_code"
            case onlyCoupon = "only_coupon"
            case isRecommendation = "is_recommendation"
            case name
            case additionalImages = "additional_images"
            case kind, contents
        }
    }

    // MARK: - AdditionalImages
    struct AdditionalImages: Codable {
    }

    // MARK: - Contents
    struct Contents: Codable {
        let data: [ListMovies]
        let meta: Meta
    }

    // MARK: - Datum
    struct ListMovies: Codable {
        let type: DatumType
        let id: String
        let numericalID: Int
        let title: String
        let year, duration: Int
        let label: String
        let classification: Classification
        let images: Images
        let highlightedScore: HighlightedScore
        let rating: Rating
        let labels: Labels

        enum CodingKeys: String, CodingKey {
            case type, id
            case numericalID = "numerical_id"
            case title, year, duration, label, classification, images
            case highlightedScore = "highlighted_score"
            case rating, labels
        }
    }

    // MARK: - Classification
    struct Classification: Codable {
        let type: ClassificationType
        let id: String
        let numericalID: Int
        let name: String
        let age: Int
        let adult: Bool
        let classificationDescription: String
        let classificationDefault: Bool

        enum CodingKeys: String, CodingKey {
            case type, id
            case numericalID = "numerical_id"
            case name, age, adult
            case classificationDescription = "description"
            case classificationDefault = "default"
        }
    }

    enum ClassificationType: String, Codable {
        case classifications = "classifications"
    }

    // MARK: - HighlightedScore
    struct HighlightedScore: Codable {
        let score: Double
        let amountOfVotes: Int
        let formattedAmountOfVotes: String
        let site: Site

        enum CodingKeys: String, CodingKey {
            case score
            case amountOfVotes = "amount_of_votes"
            case formattedAmountOfVotes = "formatted_amount_of_votes"
            case site
        }
    }

    // MARK: - Site
    struct Site: Codable {
        let type: SiteType
        let id: String
        let numericalID: Int
        let name: SiteName
        let showImage: Bool
        let scale: Int
        let image: String

        enum CodingKeys: String, CodingKey {
            case type, id
            case numericalID = "numerical_id"
            case name
            case showImage = "show_image"
            case scale, image
        }
    }

    enum SiteName: String, Codable {
        case imDB = "IMDb"
    }

    enum SiteType: String, Codable {
        case sites = "sites"
    }

    // MARK: - Images
    struct Images: Codable {
        let artwork, snapshot: String
        let ribbons: [Ribbon]
    }

    // MARK: - Ribbon
    struct Ribbon: Codable {
        let type, id: String
        let numericalID: Int
        let name, color, textColor, position: String
        let localizedName: String
        let image: String?

        enum CodingKeys: String, CodingKey {
            case type, id
            case numericalID = "numerical_id"
            case name, color
            case textColor = "text_color"
            case position
            case localizedName = "localized_name"
            case image
        }
    }

    // MARK: - Labels
    struct Labels: Codable {
        let audioQualities, hdrTypes: [AudioQuality]
        let purchaseTypes: [PurchaseType]
        let videoQualities: [AudioQuality]

        enum CodingKeys: String, CodingKey {
            case audioQualities = "audio_qualities"
            case hdrTypes = "hdr_types"
            case purchaseTypes = "purchase_types"
            case videoQualities = "video_qualities"
        }
    }

    // MARK: - AudioQuality
    struct AudioQuality: Codable {
        let type: AudioQualityType
        let id: Abbr
        let numericalID: Int
        let name: AudioQualityName
        let abbr: Abbr
        let image: String?
        let position: Int?

        enum CodingKeys: String, CodingKey {
            case type, id
            case numericalID = "numerical_id"
            case name, abbr, image, position
        }
    }

    enum Abbr: String, Codable {
        case none = "NONE"
        case sd = "SD"
        case the20 = "2.0"
    }

    enum AudioQualityName: String, Codable {
        case sd = "SD"
        case sdr = "SDR"
        case the20Stereo = "2.0 (Stereo)"
    }

    enum AudioQualityType: String, Codable {
        case audioQualities = "audio_qualities"
        case hdrTypes = "hdr_types"
        case videoQualities = "video_qualities"
    }

    // MARK: - PurchaseType
    struct PurchaseType: Codable {
        let type: PurchaseTypeType
        let id: String
        let numericalID: Int
        let isRecurring: Bool
        let name: PurchaseTypeName
        let label: Label
        let kind: Kind
        let expiresAfterInSeconds, availableTimeInSeconds: Int?

        enum CodingKeys: String, CodingKey {
            case type, id
            case numericalID = "numerical_id"
            case isRecurring = "is_recurring"
            case name, label, kind
            case expiresAfterInSeconds = "expires_after_in_seconds"
            case availableTimeInSeconds = "available_time_in_seconds"
        }
    }

    enum Kind: String, Codable {
        case purchase = "purchase"
        case rental = "rental"
    }

    enum Label: String, Codable {
        case alquiler48H = "ALQUILER 48H"
        case ventaDigitalLocker = "VENTA (DIGITAL LOCKER)"
    }

    enum PurchaseTypeName: String, Codable {
        case alquiler48H = "Alquiler 48H"
        case ventaDigitalLocker = "Venta (Digital Locker)"
    }

    enum PurchaseTypeType: String, Codable {
        case purchaseTypes = "purchase_types"
    }

    // MARK: - Rating
    struct Rating: Codable {
        let average, scale: Int
    }

    enum DatumType: String, Codable {
        case movies = "movies"
    }

    // MARK: - Meta
    struct Meta: Codable {
        let pagination: Pagination
    }

    // MARK: - Pagination
    struct Pagination: Codable {
        let page, count, perPage, offset: Int
        let totalPages: Int

        enum CodingKeys: String, CodingKey {
            case page, count
            case perPage = "per_page"
            case offset
            case totalPages = "total_pages"
        }
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable  {
        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
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


}
