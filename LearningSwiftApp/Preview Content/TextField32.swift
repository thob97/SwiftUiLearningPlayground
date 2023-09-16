//
//  TextField32.swift
//  LearningSwiftApp
//
//  Created by Thore Brehmer on 14.09.23.
//

import SwiftUI

//takeaways
//1. simplest textfield version is sufficient TextField(title ,binding)
//2. easy validation with simple bool, (more advanced and complex with enums)
//3. can have special textfield formats
//4. secure textField also exists
//5. has some minor preconfigured styles -> mostly must be styled ourselves tho
//6. has default maxWidth infinity
//7. use .onSubmit & .focused(for onEditChanged???)
struct TextField32: View {
    @State var textField1: String = ""
    @State var textField3: Date = Date()
    @State var displayData: [String] = []
    @State var displayDate: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.green.opacity(0.1).ignoresSafeArea()
                
                VStack (alignment:.leading) {
                    
                    //validation text
                    if !validate {Text("needs 8 char long text").foregroundColor(.red).padding(.leading)}
                    
                    //this version should be sufficient in most cases!
                    //TextField(LocalizedStringKey, text: Binding<String>)
                    
                    //prompt var, and first var -> same purpose
                    TextField("prompt1", text: $textField1, prompt: Text("prompt2"), axis: .horizontal)
                        .font(.title)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding()
                        //on enter press
                        .onSubmit(uploadData)
                    
                    //with label as prompt -> useless as it also only accepts text
//                    TextField(text: $textField1) {
//                        Label("Text", systemImage: "pencil.tip")
//                    }
                    
                    //with format
                    //format can also be customised
                    TextField("123", value: $textField3, format: .dateTime)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    //secure textfield
                    SecureField("Password", text: $textField1)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    //Button
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
