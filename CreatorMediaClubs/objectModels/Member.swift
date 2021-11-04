import Foundation

struct Member: Identifiable, Codable {
    let id: Int
    let firstName: String?
    let lastName: String?
    let clubs: [Club]
}
