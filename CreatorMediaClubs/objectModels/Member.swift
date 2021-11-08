import Foundation

/// The user is a Member holding basic information
struct Member: Identifiable, Codable {
    let id: Int
    let firstName: String?
    let lastName: String?
    let clubCollection: ClubCollection
}

/// this serves to hold all the clubs of the user in one object
internal struct ClubCollection: Codable {
    let movieClubs: [Club<Movie>]?
    let bookClubs: [Club<Book>]?
    let albumClubs: [Club<Album>]?
    let artClubs: [Club<Art>]?
}
