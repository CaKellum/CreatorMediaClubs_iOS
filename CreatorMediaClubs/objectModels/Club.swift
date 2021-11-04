import Foundation

struct Club: Codable {
    let mediaOfMonth: Media
    let previousMediaOfTheMonth: [Media]
    let upcomingMediaOfTheMonth: [Media]
}
