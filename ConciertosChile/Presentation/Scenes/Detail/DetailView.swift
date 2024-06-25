import SwiftUI
import WebKit

struct DetailView: UIViewRepresentable {
    @Bindable var event: EventModel
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: event.url) else {
            // an error occurred
            fatalError("wrong url")
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
