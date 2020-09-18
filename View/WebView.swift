//
//  WebView.swift
//  Hacker News
//
//  Created by Yesbolat Syilybay on 11.09.2020.
//  Copyright © 2020 conizer. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
	let urlString: String?
	
	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
		if let safeString = urlString {
			if let url = URL(string: safeString) {
				let request = URLRequest(url: url)
				uiView.load(request)
			}
		}
	}
}
