//
//  DetailView.swift
//  Hacker News
//
//  Created by Yesbolat Syilybay on 11.09.2020.
//  Copyright © 2020 conizer. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
	let url: String?

    var body: some View {
		WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(url: "http://www.goole.com").previewLayout(.sizeThatFits)
    }
}
