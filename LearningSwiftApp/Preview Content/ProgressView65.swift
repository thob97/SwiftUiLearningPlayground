//
//  ProgressIndicator65.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 01.10.23.
//

import SwiftUI

//takeaways:
//1. there are 2 default animation views (circle & linear)
//2. progressView can have a custom label
//3. can be animated by: task, animation, timeInterval (or a combination of them)

struct ProgressView65: View {
    @State var progressOnlyTask = 0.0
    @State var progressTaskAnimated = 0.0
    @State var progressOnlyAnimated: Double = 0.0
    
    let startDate = Date()
    
    var body: some View {
        VStack(spacing: 50){
            //with label
            ProgressView("Test")
            ProgressView {Text("Label")}.progressViewStyle(.linear)
            
            //async task
            ProgressView(value: progressOnlyTask, total: 10.0)
                .task {
                    while true {
                        if progressOnlyTask >= 10.0 {progressOnlyTask = 0}
                        else {
                            progressOnlyTask += 0.1
                        }
                        try? await Task.sleep(for: .microseconds(20000))
                    }
                }
            
            //async task with random & animation
            ProgressView(value: progressTaskAnimated, total: 10.0)
                .task {
                    while true {
                        if progressTaskAnimated >= 10.0 {progressTaskAnimated = 0}
                        else {
                            progressTaskAnimated += Double.random(in: 0..<6)
                        }
                        try? await Task.sleep(for: .seconds(Double.random(in: 0.5...2)))
                    }
                }.animation(.default)
            
            //animated
            ProgressView(value: progressOnlyAnimated, total: 10.0)
                .animation(.default)
                .onTapGesture(count: 2) {progressOnlyAnimated = 0}
                .onTapGesture {progressOnlyAnimated = 10.0}
            
            //timeInterval
            let endDate = Calendar.current.date(byAdding: .second, value: 10, to: startDate)!
            ProgressView(timerInterval: startDate...endDate, countsDown: true)
        }
    }
}

struct ProgressView65_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView65()
    }
}
