import Foundation

/// Protocol to describe generic media
protocol Media: Codable, Identifiable, Equatable, CustomStringConvertible {
    associatedtype MediaType: Media

    /// Object Id set by item in server DB
    var id: String { get }
    /// Name of the Media
    var title: String? { get }
    /// Year of publishing
    var yearOfCreation: Date? { get }

    ///  equates two Media type together
    /// - Returns: true if equal, false otherwise
    static func == (lhMedia: Self, rhMedia: Self) -> Bool

    /// Check if Media is media of the month for the club
    /// - Returns: true if is the clubs media of the month, fals eother wise
    func isMediaOfTheMonth(for club: Club<MediaType>) -> Bool

    /// generates description string for object
    /// - Returns: String describing the object
    func generateDescription() -> String
}

/// album media, retains trak list ans computes some things as to not need it stored in the server
struct Album: Media {

    let id: String
    let title: String?
    /// the list of songs on the album
    let trackList: [Song]?
    let yearOfCreation: Date?
    var description: String {
        self.generateDescription()
    }
    /// the artists featured on the album
    var albumArtists: [String] {
        Self.getArtists(for: self)
    }
    /// the total length of the album
    var albumLength: Double {
        Self.getLength(for: self)
    }

    // MARK: - Media Protocol Functions

    static func == (lhMedia: Album, rhMedia: Album) -> Bool {
        lhMedia.id == rhMedia.id && lhMedia.title == rhMedia.title
    }

    func isMediaOfTheMonth(for club: Club<Album>) -> Bool {
        club.mediaOfMonth == self
    }

    func generateDescription() -> String {
        return "Album: \(id) {title: \(title ?? "unknown"), artists: \(albumArtists), length: \(albumLength)}"
    }

    // MARK: - private functions

    /// grabs artists from albums tracklist
    /// - Parameter album: the album that is needing to respond to  a call for this
    /// - Returns: list of artists names in string array
    private static func getArtists(for album: Self) -> [String] {
        var artists = [String]()
        for song in album.trackList ?? [] {
            artists.append(song.artist ?? "unknown")
        }
        return artists.unique()
    }

    /// grabs total length of albums
    /// - Parameter album: ablum that needs to repond to call for length
    /// - Returns: a  double representation of time in minutes of how long the complete album is
    private static func getLength(for album: Self) -> Double {
        var length = 0.0
        for song in album.trackList ?? [] {
            length += song.length ?? 0.0
        }
        return length
    }
}

///  Song Media that is typically part of Albums
struct Song: Media {

    let id: String
    let title: String?
    /// person credited for singing the song
    let artist: String?
    /// person credited for writing the song if nil is artist
    let writer: String?
    /// length of song in minutes
    let length: Double?
    let yearOfCreation: Date?
    var description: String {
        self.generateDescription()
    }

    // MARK: - Media Protocol Functions

    static func == (lhMedia: Song, rhMedia: Song) -> Bool {
        lhMedia.id == rhMedia.id && lhMedia.title == rhMedia.title && lhMedia.artist == rhMedia.artist
    }

    func isMediaOfTheMonth(for club: Club<Song>) -> Bool {
        club.mediaOfMonth == self
    }

    func generateDescription() -> String {
        "Song: \(id) {title: \(title ?? "unknown"), artist: \(artist ?? "unknown")}"
    }
}

/// anything that isn't easily definable as an album, book, song or Movie
struct Art: Media {

    let id: String
    let title: String?
    /// Used in this as a start date in the creation
    let yearOfCreation: Date?
    /// Year that the artwork was completed
    let yearOfCompletion: Date?
    /// person credited with making the art
    let artist: String?
    /// short description about the peice/ compisition
    let blurb: String?
    var description: String {
        self.generateDescription()
    }

    // MARK: - Media Protocol Functions

    static func == (lhMedia: Art, rhMedia: Art) -> Bool {
        lhMedia.id == rhMedia.id && lhMedia.title == rhMedia.title && lhMedia.artist == rhMedia.artist
    }

    func isMediaOfTheMonth(for club: Club<Art>) -> Bool {
        club.mediaOfMonth == self
    }

    func generateDescription() -> String {
        "Art: \(id) {title: \(title ?? "unknown"), artist: \(artist ?? "unknown")}"
    }
}
/// a collection of text typically housing a or several naratives
struct Book: Media {

    let id: String
    /// similar to id but internationally recognized as this book
    let isbn: String?
    let title: String?
    let yearOfCreation: Date?
    /// number of pages in the book
    let pageCount: Int?
    /// number of chapters in the book
    let chapterCount: Int?
    /// if comic/manga the name of the artist/mangaka
    let artist: String?
    /// person who is creddited with writting the book
    let author: String?
    var description: String {
        self.generateDescription()
    }

    // MARK: - Media Protocol Functions

    static func == (lhMedia: Book, rhMedia: Book) -> Bool {
        lhMedia.id == rhMedia.id && lhMedia.title == rhMedia.title && lhMedia.author == rhMedia.author
    }

    func isMediaOfTheMonth(for club: Club<Book>) -> Bool {
        club.mediaOfMonth == self
    }

    func generateDescription() -> String {
        "Book: \(id) {title: \(title ?? ""), author: \(author ?? "Unknown"), isbn: \(isbn ?? "")}"
    }

}

/// any picture that moves
struct Movie: Media {

    let id: String
    let title: String?
    let yearOfCreation: Date?
    /// person credited with directing the movie
    let director: String?
    /// person credited with writing the film
    let writer: String?
    /// duration of the movie
    let lengthOfMovir: Double?
    var description: String {
        self.generateDescription()
    }

    // MARK: - Media Protocol Functions

    static func == (lhMedia: Movie, rhMedia: Movie) -> Bool {
        lhMedia.id == rhMedia.id && lhMedia.title == rhMedia.title && lhMedia.yearOfCreation == rhMedia.yearOfCreation
    }

    func isMediaOfTheMonth(for club: Club<Movie>) -> Bool {
        club.mediaOfMonth == self
    }

    func generateDescription() -> String {
        "Book: \(id) {title: \(title ?? ""), author: \(director ?? "Unknown"), writer: \(writer ?? "Unknown")}"
    }
}

/// an enum that will allow for quick identification of objects
enum MediaType: String {
    case movie = "Movie",
         book = "Book",
         album = "Album",
         song = "Song",
         art = "Art"
}
