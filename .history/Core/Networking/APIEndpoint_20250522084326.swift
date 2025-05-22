enum APIEndpoint {
    case users
    case user(id: Int)

    var path: String {
        switch self {
        case .users: return "/users"
        case .user(let id): return "/users/\(id)"
        }
    }
}
