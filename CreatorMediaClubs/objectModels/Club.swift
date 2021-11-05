import Foundation

struct Club<T: Media>: Codable, Identifiable {
    let id: Int
    let mediaOfMonth: T?
    let previousMediaOfTheMonth: [T]?
    let upcomingMediaOfTheMonth: [T]?
}
