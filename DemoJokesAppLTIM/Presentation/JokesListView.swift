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
            Text("Jokes").font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
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
                    .ButtonStyle()
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

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .font(.title)
            .padding()
            .background(Color.blue)
            .cornerRadius(30)
            .foregroundColor(.white)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.blue, lineWidth: 5)
            )
    }
}

extension View {
    func ButtonStyle() -> some View {
        modifier(ButtonModifier())
    }
}
