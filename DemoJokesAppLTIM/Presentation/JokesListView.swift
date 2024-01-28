//
//  JokesListView.swift
//  DemoJokesAppLTIM
//
//  Created by 61092893 on 28/01/24.
//

import SwiftUI

struct JokesListView: View {
    @StateObject var vm = JokesListViewModel()

    var body: some View {
          List{
              ForEach(vm.jokes) { jokes in
                  HStack{
                      Text("\(jokes.joke)")
                  }
              }
          }
          .task {
              await vm.getJokes()
          }
          .listStyle(PlainListStyle())
          .navigationTitle("Jokes")
          
      }
}

#Preview {
    NavigationView{
        Spacer()
        JokesListView()
    }.navigationViewStyle(StackNavigationViewStyle())
}
