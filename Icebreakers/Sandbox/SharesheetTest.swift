////
////  SharesheetTest.swift
////  Icebreakers
////
////  Created by Rob Lisenko on 4/25/23.
////
//
//import SwiftUI
//
////struct Photo: Transferable {
////    static var transferRepresentation: some TransferRepresentation {
////        ProxyRepresentation(exporting: \.image)
////    }
////
////    public var image: Image
////    public var caption: String
////}
//
//struct SharesheetTest: View {
//    let link = URL(string: "https://www.hackingwithswift.com")!
//    private let image = UIImage(named: "UnfrozenMasto")!
////    let photo: Photo
//
////    var body: some View {
////        VStack(spacing: 20) {
////            ShareLink(item: link, message: Text("Learn Swift here!"))
//////            ShareLink("Learn Swift here", item: image)
////
////
////            ShareLink(item: link) {
////                Label("Learn Swift here", systemImage: "swift")
////            }
////        }
////    }
//    let photo: Photo
//
//    var body: some View {
//        photo.image
//            .toolbar {
//                ShareLink(
//                    item: photo,
//                    preview: SharePreview(
//                        photo.caption,
//                        image: photo.image))
//            }
//    }
//
//}
//struct PhotoView: View {
//    let photo: Photo
//
//    var body: some View {
//        photo.image
//            .toolbar {
//                ShareLink(
//                    item: photo,
//                    preview: SharePreview(
//                        photo.caption,
//                        image: photo.image))
//            }
//    }
//}
//
////struct SharesheetTest_Previews: PreviewProvider {
////    static let photo = Image("UnfrozenMasto")
////
////    static var previews: some View {
////        SharesheetTest(photo: Image)
////    }
////}
