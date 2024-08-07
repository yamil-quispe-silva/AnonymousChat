
//
//  NewChatView.swift
//  AnonymousChat
//
//  Created by Yamil on 7/15/24.
//

import SwiftUI



// two errors:
// - navbar is white for a sec
// - when you click on the texteditor the background moves

//struct CustomShapeStyle: ShapeStyle {
//    func _apply(to shape: inout _ShapeStyle_Shape) {
//        shape.fill(Color.black.opacity(0.4))
//    }
//}
//


struct NewChatView: View {
    
    @State private var groupName: String = ""
    @State private var selectedDate: Date = Date()
    @State private var descriptionText: String = ""
    @StateObject private var viewModel = NewGroupViewModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        GroupPhoto()
                            .padding(.top, -25)
                        GroupNameAndDateAndPeople()
                        DescriptionField()
                        ParticipantsSection()
                        VisibilitySection()
                        CitySection()
                        ExitButton()
                    }
                    .padding(.horizontal)
                    .foregroundColor(.white)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("New Chat")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                    }
                }
                .toolbarBackground(Color.black.opacity(0.85), for: .navigationBar)
            }
            .background(
                ZStack {
                    Image("group_pic")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 30)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    
//                    Rectangle()
//                        .foregroundColor(Color.black.opacity(0.3))
//                        .edgesIgnoringSafeArea(.all)
                }
                
                
            )
        }
    }
    
    
    
    private func GroupPhoto() -> some View {
        Image("group_pic")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame( width: 370, height: 350)
            .cornerRadius(25)
            .frame(maxWidth: .infinity)
            .overlay(alignment: .bottomTrailing) {
                HStack {
                    Button(action: {
                        // Edit action
                    }) {
                        editButton()
                            .padding(.trailing, 25)
                            .padding(.bottom, 15)
                    }
                }
            }
    }
    
    private func editButton() -> some View {
        HStack (spacing: 5) {
            Image(systemName: "photo.fill")
                .foregroundColor(.white)
                .font(.custom("Swiss 721 Bold Rounded", size: 15))
            
            
            Text("edit")
                .foregroundColor(.white)
                .font(.custom("Swiss 721 Bold Rounded", size: 13))
            
        }
        .padding(.vertical, 7)
        .padding(.horizontal, 15)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.gray.opacity(0.3))
        )
    }
    
    private func GroupNameAndDateAndPeople() -> some View {
        VStack (alignment: .leading, spacing: 9){
            ZStack(alignment: .leading) {
                if groupName.isEmpty {
                    Text("Group Name")
                        .font(.custom("FONTSPRING DEMO - Roc Grotesk Wide", size: 27))
                        .foregroundColor(Color.white.opacity(0.3))
                        .padding(.horizontal)
                }
                
                TextField("", text: $groupName)
                    .font(.custom("FONTSPRING DEMO - Roc Grotesk Wide", size: 23))
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .disableAutocorrection(true)
                    .background(Color.clear)
            }
            
            // DAT AND PEOPLE SECTION
            
            HStack (spacing: 8) {
                ZStack {
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                        .opacity(0) // Hide the original date text
                    
                    Text("\(selectedDate, formatter: dateFormatter)")
                        .font(.subheadline)
                        .foregroundColor(Color.white) // Low opacity white text
                }
                .padding(.vertical, -1)
                .padding(.horizontal, 6)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(8)
                
                Text("4 people")
                    .font(.subheadline)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 13)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private func DescriptionField() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Description")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    // Save action
                }) {
                    Text("save")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            
            MultipleLineTextField(placeholder: "Add group description...", text: $descriptionText)
            
            
        }
        
    }
    
    private func ParticipantsSection() -> some View {
        VStack(spacing: 8) {
            
            HStack {
                Text("Participants")
                    .font(.headline)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            
            ForEach(participants, id: \.self) { participant in
                HStack {
                    Image(participant.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(participant.name)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        // Remove participant action
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
            }
            
            Button(action: {
                // Add participant action
            }) {
                Image(systemName: "plus")
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
    }
    
    private func VisibilitySection() -> some View {
        HStack {
            Text("Visibility")
                .foregroundColor(.white)
            
            Spacer()
            
            Picker("Visibility", selection: .constant("Public")) {
                Text("Public").tag("Public")
                Text("Private").tag("Private")
            }
            .pickerStyle(MenuPickerStyle())
        }
        .padding(.horizontal)
    }
    
    private func CitySection() -> some View {
        HStack {
            Text("City")
                .foregroundColor(.white)
            
            Spacer()
            
            Picker("City", selection: .constant("Lima")) {
                Text("Lima").tag("Lima")
            }
            .pickerStyle(MenuPickerStyle())
        }
        .padding(.horizontal)
    }
    
    private func ExitButton() -> some View {
        Button(action: {
            // Exit group action
        }) {
            Text("Exit Group")
                .foregroundColor(.red)
        }
        .padding()
    }

}



struct Participant: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
}

let participants = [
    Participant(name: "Mariano Rojas", imageName: "mariano"),
    Participant(name: "Raul Ochoa", imageName: "raul"),
    Participant(name: "Yamil Quispe", imageName: "yamil"),
    Participant(name: "Rodolfo Cortez", imageName: "rodolfo")
]

#Preview {
    NewChatView()
}
