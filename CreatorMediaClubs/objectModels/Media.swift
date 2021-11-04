struct Media: Codable, Identifiable, Equatable {
    let id: Int
    let title: String?
    let mediaTypeString: String?
    let trackList: [Song]?

    var mediaType: MediaType {
        MediaType.getType(from: mediaTypeString ?? "")
    }

    var albulmArtists: [String]? {
        var artists = [String]()
        trackList?.forEach({ artists.append($0.artist ?? "") })
        return mediaType == .album ? artists.unique() : nil
    }

    static func == (_ lhMedia: Media, _ rhMedia: Media) -> Bool {
        lhMedia.id == rhMedia.id && lhMedia.title == rhMedia.title
    }

    func isMediaOfTheMonth(for club: Club) -> Bool {
        self == club.mediaOfMonth
    }

    enum MediaType: String {
        case movie, album, book, comic, unknown

        static func getType(from string: String) -> Self {
            switch string.lowercased() {
            case "movie":
                return .movie
            case "album":
                return .album
            case "book":
                return .book
            case "comic":
                return .comic
            default:
                return .unknown
            }
        }
    }
}

struct Song: Codable {
    let title: String?
    let artist: String?
    let length: String?
}
