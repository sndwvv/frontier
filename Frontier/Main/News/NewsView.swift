//
//  NewsView.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/22.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.state {
                case .loading:
                    NewsLoadingView()
                case .error(let errorMessage):
                    NewsErrorView(viewModel: viewModel, errorMessage: errorMessage)
                case .empty:
                    Text("Empty View")
                case .loaded(let articles):
                    NewsListView(articles: articles)
                }
            }
            .navigationTitle("News")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NewsViewModel()
        NewsView(viewModel: viewModel)
    }
}
