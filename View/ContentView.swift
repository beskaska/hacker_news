//
//  ContentView.swift
//  Hacker News
//
//  Created by Yesbolat Syilybay on 10.09.2020.
//  Copyright © 2020 conizer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var networkManager = NetworkManager()
	
    var body: some View {
		NavigationView {
			List(networkManager.posts) { post in
				if post.url != nil {
					NavigationLink(destination: DetailView(url: post.url)) {
						PostCell(post: post)
					}
				} else {
					PostCell(post: post)
				}
			}
			.navigationBarTitle("HACKER NEWS")
		}
		.onAppear {
			self.networkManager.fetchData()
		}
    }
}

struct PostCell: View {
	let post: Post

	var body: some View {
		HStack {
			Text(String(post.points))
			Text(post.title)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView().previewDevice("iPhone 8")
    }
}
