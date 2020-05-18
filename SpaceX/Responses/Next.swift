// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let next = try? newJSONDecoder().decode(Next.self, from: jsonData)

import Foundation

// MARK: - Next
public class Next: Decodable  {
    public let flightNumber: Int
    public let missionName: String
    public let missionID: [String]
    public let launchYear: String
    public let launchDateUnix: Int
    public let launchDateUTC: String
    public let launchDateLocal: Date
    public let isTentative: Bool
    public let tentativeMaxPrecision: String
    public let tbd: Bool
    public let launchWindow: String?
    public let rocket: Rocket
    public let ships: [String]
    public let telemetry: Telemetry
    public let launchSite: LaunchSite
    public let launchSuccess: Bool?
    public let links: Links
    public let details: String?
    public let upcoming: Bool
    public let staticFireDateUTC, staticFireDateUnix, timeline: String?

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case tbd
        case launchWindow = "launch_window"
        case rocket, ships, telemetry
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case links, details, upcoming
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case timeline
    }
}

// MARK: - LaunchSite
public class LaunchSite: Codable {
    public let siteID, siteName, siteNameLong: String

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case siteName = "site_name"
        case siteNameLong = "site_name_long"
    }
}

// MARK: - Links
public class Links: Codable {
    public let missionPatch, missionPatchSmall: String?
    public let redditCampaign: String
    public let redditLaunch, redditRecovery, redditMedia, presskit: String?
    public let articleLink, wikipedia, videoLink, youtubeID: String?
    public let flickrImages: [String]

    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case redditCampaign = "reddit_campaign"
        case redditLaunch = "reddit_launch"
        case redditRecovery = "reddit_recovery"
        case redditMedia = "reddit_media"
        case presskit
        case articleLink = "article_link"
        case wikipedia
        case videoLink = "video_link"
        case youtubeID = "youtube_id"
        case flickrImages = "flickr_images"
    }
}

// MARK: - Rocket
public class Rocket: Codable {
    public let rocketID, rocketName, rocketType: String
    public let firstStage: FirstStage
    public let secondStage: SecondStage
    public let fairings: Fairings

    enum CodingKeys: String, CodingKey {
        case rocketID = "rocket_id"
        case rocketName = "rocket_name"
        case rocketType = "rocket_type"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case fairings
    }
}

// MARK: - Fairings
public class Fairings: Codable {
    public let reused, recoveryAttempt, recovered: Bool
    public let ship: String?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ship
    }
}

// MARK: - FirstStage
public class FirstStage: Codable {
    public let cores: [Core]
}

// MARK: - Core
public class Core: Codable {
    public let coreSerial: String
    public let flight, block: Int
    public let gridfins, legs, reused: Bool
    public let landSuccess: Bool?
    public let landingIntent: Bool
    public let landingType, landingVehicle: String

    enum CodingKeys: String, CodingKey {
        case coreSerial = "core_serial"
        case flight, block, gridfins, legs, reused
        case landSuccess = "land_success"
        case landingIntent = "landing_intent"
        case landingType = "landing_type"
        case landingVehicle = "landing_vehicle"
    }
}

// MARK: - SecondStage
public class SecondStage: Codable {
    public let block: Int
    public let payloads: [Payload]
}

// MARK: - Payload
public class Payload: Codable {
    public let payloadID: String
    public let noradID: [String]
    public let reused: Bool
    public let customers: [String]
    public let nationality: String
    public let manufacturer: String?
    public let payloadType: String
    public let payloadMassKg: Int?
    public let payloadMassLbs: Double?
    public let orbit: String
    public let orbitParams: OrbitParams

    enum CodingKeys: String, CodingKey {
        case payloadID = "payload_id"
        case noradID = "norad_id"
        case reused, customers, nationality, manufacturer
        case payloadType = "payload_type"
        case payloadMassKg = "payload_mass_kg"
        case payloadMassLbs = "payload_mass_lbs"
        case orbit
        case orbitParams = "orbit_params"
    }
}

// MARK: - OrbitParams
public class OrbitParams: Codable {
    public let referenceSystem, regime: String?
    public let longitude, semiMajorAxisKM, eccentricity, periapsisKM: String?
    public let apoapsisKM, inclinationDeg, periodMin: String?
    public let lifespanYears: Double?
    public let epoch, meanMotion, raan, argOfPericenter: String?
    public let meanAnomaly: String?

    enum CodingKeys: String, CodingKey {
        case referenceSystem = "reference_system"
        case regime, longitude
        case semiMajorAxisKM = "semi_major_axis_km"
        case eccentricity
        case periapsisKM = "periapsis_km"
        case apoapsisKM = "apoapsis_km"
        case inclinationDeg = "inclination_deg"
        case periodMin = "period_min"
        case lifespanYears = "lifespan_years"
        case epoch
        case meanMotion = "mean_motion"
        case raan
        case argOfPericenter = "arg_of_pericenter"
        case meanAnomaly = "mean_anomaly"
    }
}

// MARK: - Telemetry
public class Telemetry: Codable {
    public let flightClub: String?

    enum CodingKeys: String, CodingKey {
        case flightClub = "flight_club"
    }
}

