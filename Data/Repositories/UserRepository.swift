import Foundation

@MainActor
final class UserRepository {
    func fetchAll() async throws -> [User] {
        struct Response: Codable { let data: [User] }
        let response: Response = try await APIService.shared.request(.users)
        return response.data
    }
}
