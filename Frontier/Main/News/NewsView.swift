//
//  NewsView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var fetcher = NewsArticleFetcher()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                if fetcher.isLoading {
                    NewsLoadingView()
                } else if fetcher.errorMessage != nil {
                    NewsErrorView(fetcher: fetcher)
                } else {
                    NewsListView(articles: fetcher.articles)
                }
            }.navigationTitle("News")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
