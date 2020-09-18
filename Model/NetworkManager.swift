//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Yesbolat Syilybay on 10.09.2020.
//  Copyright © 2020 conizer. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
	@Published var posts: [Post] = []
	
	func fetchData() {
		if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
			let session = URLSession(configuration: .default)
			let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
				if error == nil {
					let decoder = JSONDecoder()
					do {
						let decodedData = try decoder.decode(Results.self, from: data!)
						DispatchQueue.main.async {
							self.posts = decodedData.hits
						}
					} catch {
						print(error)
					}
				} else {
					print(error!)
				}
			})
			task.resume()
		}
	}
}
