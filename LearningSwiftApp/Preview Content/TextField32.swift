//
//  TextField32.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 14.09.23.
//

import SwiftUI

//takeaways
//1. simplest textfield version is sufficient TextField(title ,binding)
//2. easy validation with simple bool, just check via condition before calling uploading functions (more advanced and complex with enums)
//3. can have special textfield formats (like date, number, currency, percent, url, are predefined)
//4. secure textField also exists
//5. has some minor preconfigured styles -> mostly must be styled ourselves tho
//6. has default maxWidth infinity
//7. use .onSubmit & TODO: .focused (for onEditChanged???)

struct TextField32: View {
    @State var textField1: String = ""
    @State var textField3: Date = Date()
    @State var displayData: [String] = []
    @State var displayDate: String = ""
    @State var num: Decimal.FormatStyle.Percent.FormatInput = Decimal.FormatStyle.Percent.FormatInput(floatLiteral: 100)
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                //background
                Color.green.opacity(0.1).ignoresSafeArea()
                
                VStack (alignment:.leading) {
                    
                    //validation text
                    if !validate {Text("needs 8 char long text").foregroundColor(.red).padding(.leading)}
                    
                    //first var & prompt var  -> same purpose, but latter can be customised
                    TextField("prompt1",
                              text: $textField1,
                              prompt: Text("can be customised").foregroundColor(.blue)
                    )
                        .font(.title)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding()
                        //on enter press
                        .onSubmit({
                            if (validate) {uploadData()}
                        })
                    
                    //with predefined formats
                    //format can also be customised
                    TextField("123", value: $textField3, format: .dateTime)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    //decimal format
                    TextField("", value: $num, format: .percent)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    //secure textfield
                    SecureField("Password", text: $textField1)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    //Save Button
                    Button {
                        uploadData()
                    } label: {
                        Text("Save")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(validate ? .blue : .gray)
                    }.disabled(!validate)
                    
                    
                    //Notes
                    Text(displayDate)
                    ForEach(displayData, id: \.self) { data in
                        Text(data)
                    }
                    
                    Spacer()
                }
                //title
                .navigationTitle("TextFields")
            }
        }
    }
    
    var validate: Bool { textField1.count > 8 }
    
    func uploadData(){
        //add to notes
        if validate {displayData.append(textField1)}
        displayDate = textField3.formatted()
        //empty textfields
        textField1 = ""
        textField3 = Date()
    }
    
}

struct TextField32_Previews: PreviewProvider {
    static var previews: some View {
        TextField32()
    }
}
