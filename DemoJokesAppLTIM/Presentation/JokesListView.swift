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
                .accessibility(label: Text("Jokes List"))
            List{
                ForEach(vm.jokes) { jokes in
                    HStack{
                        Text("\(jokes.joke)")
                            .accessibility(label: Text("\(jokes.joke)"))
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
            Button(action: {
                Task {
                    await refreshList()
                }
            }) {
                Text("Refresh")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.blue, lineWidth: 5)
                    )
            }
            .accessibilityLabel("Refresh")
            .accessibilityAddTraits(.isButton)
            .accessibilityHint("Tap the button to refresh the list")
        }
    }
}

#Preview {
        JokesListView()
}
