//
//  OnAppearDisappear43.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 19.09.23.
//

import SwiftUI

//takeaways:
//1. .onAppear & .onDisappear run code once loaded to view (instant if not lazy)
//2. (e.g. if you only want to load/fetch images once the item is in view) (if you want to clean up database connections)
struct OnAppearDisappear43: View {
    @State var countInView: Int = 0
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack {
                    ForEach(0..<50) { num in
                        Rectangle()
                            .frame(height: 200)
                            .cornerRadius(20)
                            .padding()
                            .overlay(content: {
                                Text("\(num)").foregroundColor(.white).font(.title)
                            })
                            .onAppear {
                                countInView += 1
                            }
                            .onDisappear {
                                countInView -= 1
                            }
                            .padding(.vertical, 100) //change this to see the change on countInView
                    }
                    
                }
            }
            .navigationTitle("Currently In View: \(countInView)")
        }
    }
}

struct OnAppearDisappear43_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearDisappear43()
    }
}
