import SwiftUI
import WebKit

struct DetailFavoriteView: UIViewRepresentable {
    @Bindable var event: EventFavorite
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: event.url) else {
            fatalError("wrong url")
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
