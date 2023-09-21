//
//  SystemMaterial51.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 20.09.23.
//

import SwiftUI

//takeaways:
//1. predefined colours (for backgrounds) (which apple uses in their apps as well -> good for consistent)
//2. are blurry and opacity

struct SystemMaterial51: View {
    @State var url: URL? = URL(string: "https://picsum.photos/1200")
    
    var body: some View {
        ZStack {
            //background
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height)
            } placeholder: {
                ProgressView()
            }
            .onTapGesture {
                let random = [200,300,400,500,600,700,800,100].randomElement()
                url = URL(string: "https://picsum.photos/\(random ?? 600)")
            }
            
            //popover like
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 30)
                    .fill(.ultraThinMaterial)
                    .frame(height: 300)
                    .overlay {
                        VStack {
                            RoundedRectangle(cornerRadius: 4)
                                .frame(width: 50, height: 4)
                                .padding()
                            Spacer()
                        }
                    }
            }
        }
    }
}

struct SystemMaterial51_Previews: PreviewProvider {
    static var previews: some View {
        SystemMaterial51()
    }
}
