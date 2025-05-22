import Foundation

@MainActor
final class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false

    private let repo = UserRepository()

    func refresh() {
        Task {
            isLoading = true
            defer { isLoading = false }
            users = (try? await repo.fetchAll()) ?? []
        }
    }
}
