import Foundation

/// Club is the organization which members can join
struct Club<T: Media>: Codable, Identifiable {
    let id: Int
    let headOfClub: String?
    let mediaOfMonth: T?
    let previousMediaOfTheMonth: [T]?
    let upcomingMediaOfTheMonth: [T]?
    let discussionBoardUrl: String?
}
