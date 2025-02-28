import Foundation

enum URLBuilderError: Error {
    case invalidBaseURL
    case invalidPath
    case invalidQueryParameters
    case invalidHeaders
    case invalidBody
}
