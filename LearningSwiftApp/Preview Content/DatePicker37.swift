//
//  DatePicker37.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 18.09.23.
//

import SwiftUI

//takeaways:
//1. predefined for picking a date in app (eg birthday, appointments, ...)
//2. has some predefined styles to choose from ()
//3. datePicker can restrict the selection into a specific range
//4. datePicker can be customised to only display wanted parts of a date (date, time, ...)
//5. a dateFormatter can be used to customise the date String/description
//6. can be resized, label can be hidden
//(7. for specific date obj: Calendar.current.date(from: DateComponents())! )
//8. multiDatePicker view can be used to offer a full calendar interface, in which multiple dates can be selected (and saved in binding)

struct DatePicker37: View {
    @State var date = Date()
    
    //formatter
    var customFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    @State private var dates: Set<DateComponents> = []

    var body: some View {
        VStack(spacing:0){
            //title: display date
            VStack{
                Text("Current Date:")
                    .font(.title)
                Text(customFormatter.string(from: date))
                    .foregroundColor(.cyan)
                    .font(.title)
            }
            //background
            .frame(maxWidth: .infinity)
            .padding(.bottom)
            .background(Color.gray.opacity(0.2).ignoresSafeArea())
            
            ScrollView {
                VStack(spacing: 0) {
                    //MultiDatePicker
                    MultiDatePicker("Multe", selection: $dates)
                        .background(Color.brown.opacity(0.3))
                    
                    //Standard compact
                    DatePicker("Standard compact", selection: $date)
                        .datePickerStyle(.compact)
                        .padding(20)
                        .background(.green.opacity(0.3))
                    
                    //Wheel
                    DatePicker("", selection: $date)
                        .datePickerStyle(.wheel)
                        .labelsHidden() //to hide label for more space
                        .scaleEffect(x: 0.8, y: 0.8) //to resize
                        .background(.blue.opacity(0.3))
                    
                    //Graphical
                    DatePicker("Never has a label", selection: $date)
                        .datePickerStyle(.graphical)
                        .background(.red.opacity(0.3))
                    
                    //Custom Label + displayedComponents
                    DatePicker(selection: $date, displayedComponents: .hourAndMinute){
                        Label("CustomLabel + only Hours/Mins", systemImage: "flame")
                    }
                        .datePickerStyle(.compact)
                        .background(.purple.opacity(0.3))
                    
                    //Range
                    VStack{
                        //custom label
                        Text("Specified Time Range")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .font(.headline)
                        //
                        DatePicker(
                            selection: $date,
                            in: Calendar.current.date(from: DateComponents(year: 2018))!...Date()
                        ) {
                            Text("Never has a label")
                        }
                        .datePickerStyle(.graphical)
                    }
                    .background(.yellow.opacity(0.3))
                }
            }
        }
    }
}

struct DatePicker37_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker37()
    }
}
