import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let createdAt, updatedAt: Date
    let nik: String?
    let name, email: String
    let workLocationID: Int?
    let groupCode: Int
    let roleID: Int
    let pgID: Int
    let companyID: Int
    let jabatan: String?
    let division: String
    let azureID, deviceID, fcmToken, profilePhotoPath: String?
    let status: String
    let roleName: String

    enum CodingKeys: String, CodingKey {
        case id, nik, name, email
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case workLocationID = "work_location_id"
        case groupCode = "group_code"
        case roleID = "role_id"
        case pgID = "pg_id"
        case companyID = "company_id"
        case jabatan, division
        case azureID = "azure_id"
        case deviceID = "device_id"
        case fcmToken = "fcm_token"
        case profilePhotoPath = "profile_photo_path"
        case status
        case roleName = "role_name"
    }
}
