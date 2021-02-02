import ArgumentParser
import Foundation

public struct DownloadFavIconCmd: ParsableCommand {
   public init() {}
   
   public static let configuration = CommandConfiguration(
      commandName: "favicon",
      abstract: "Download a site’s favicon and save it to disk as a .png file"
   )
   
   // MARK: GENERAL OPTIONS
   @Option(name: [.customLong("url"), .customShort("u")],
           help: "URL of site whose favicon is to be downloaded (e.g. https://www.swift.org/)")
   public var webURL: String
   
   //            default: "~/Desktop/Screenshots/Input",
   @Option(name: [.customLong("output"), .customShort("o")],
           help: "Path/filename to which the downloaded favicon image is to be saved")
   public var outputFilename: String
   
   mutating public func run() throws {
      do {
         try DownloadFavIconCmdImpl(args: self).downloadAndSaveFavIcon()
      } catch {
         print("ERROR: \(error)")
      }
   }
}

