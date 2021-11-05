import Foundation

protocol Media: Codable, Identifiable, Equatable, CustomStringConvertible {
    associatedtype MediaType: Media
    static func == (lhMedia: Self, rhMedia: Self) -> Bool
    func isMediaOfTheMonth(for club: Club<MediaType>) -> Bool
    func generateDescription() -> String
}

struct Song: Media {
    typealias MediaType = Song

    var id: String?
    let title: String?
    let artist: String?
    let length: String?

    var description: String {
        self.generateDescription()
    }

    static func == (lhMedia: Song, rhMedia: Song) -> Bool {
        lhMedia.id == rhMedia.id && lhMedia.title == rhMedia.title && lhMedia.artist == rhMedia.artist
    }

    func isMediaOfTheMonth(for club: Club<Song>) -> Bool {
        club.mediaOfMonth == self
    }

    func generateDescription() -> String {
        return "Song \(id ?? "nil") {title: \(title ?? "unknown"), artist: \(artist ?? "unknown")}"
    }
}

enum MediaType: String {
    case movie, book, album, song, art
}
