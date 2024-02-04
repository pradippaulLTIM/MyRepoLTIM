//
//  JokesListView.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import SwiftUI

struct JokesListView: View {
    @StateObject var vm = JokesListViewModel(getJokesUseCase: GetJokesUseCase(repo: JokesRepositoryImplementation(dataSource: JokesAPIDataSourceImplementation())))
    
    func refreshList() async {
        // asyncronously refresh your list here
        await vm.getJokes()
    }
    
    var body: some View {
        VStack {
            // ActivityIndicator(isAnimating: $vm.loading, style: .large)
            Text("Jokes").font(.headline)
            List{
                ForEach(vm.jokes) { jokes in
                    HStack{
                        Text("\(jokes.joke)")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .task {
                await vm.getJokes()
            }
            .refreshable {
                await refreshList()
            }
        }
    }
}

#Preview {
        JokesListView()
}
