import Foundation
import Cocoa

public class DownloadFavIconCmdImpl {
   private let args: DownloadFavIconCmd
   
   public init(args: DownloadFavIconCmd) {
      self.args = args
   }
   
   public func downloadAndSaveFavIcon() throws {
      do {
         try FavIcon.downloadPreferred(args.webURL, width: 400, height: 400) { result in
            if case let .success(image) = result {
               print("Loaded (\(image.size.width)x\(image.size.height))")
               _ = image.pngWrite(to: URL.init(fileURLWithPath: self.args.outputFilename))
            } else if case let .failure(error) = result {
               print("failed to download preferred favicon for \(self.args.webURL): \(error)")
            }
            exit(EXIT_SUCCESS)
         }
      } catch let error {
         print("failed to download preferred favicon for \(args.webURL): \(error)")
      }
      RunLoop.main.run()
   }
}
