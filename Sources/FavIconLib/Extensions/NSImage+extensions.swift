import Foundation
import Cocoa

extension NSImage {
   var pngData: Data? {
      print("Representations: \(representations)");
      
      guard let tiffRepresentation = tiffRepresentation,
            let bitmapImage = NSBitmapImageRep(data: tiffRepresentation)
      else { return nil }
      return bitmapImage.representation(using: .png, properties: [:])
   }
   
   func pngWrite(to url: URL, options: Data.WritingOptions = .atomic) -> Bool {
      do {
         try pngData?.write(to: url, options: options)
         return true
      } catch {
         print(error)
         return false
      }
   }
}
