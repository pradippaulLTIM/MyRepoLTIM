//
//  JokesListView.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import SwiftUI

struct JokesListView: View {
    @StateObject var vm = JokesListViewModel()
    
    func refreshList() async {
        // asyncronously refresh your list here
        await vm.getJokes()
    }
    
    var body: some View {
        VStack {
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
