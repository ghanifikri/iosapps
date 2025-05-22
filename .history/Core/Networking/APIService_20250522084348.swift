import Foundation

final class APIService {
    static let shared = APIService()
    private let session = URLSession.shared
    private let baseURL = URL(string: "https://your-api-domain.com/api")! // Ganti URL ini

    func request<T: Decodable>(_ endpoint: APIEndpoint, method: String = "GET", body: Data? = nil) async throws -> T {
        var request = URLRequest(url: baseURL.appendingPathComponent(endpoint.path))
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpBody = body

        let (data, response) = try await session.data(for: request)
        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}
