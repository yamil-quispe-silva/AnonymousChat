//
//  PickSchoolView.swift
//  AnonymousChat
//
//  Created by Yamil on 6/29/24.
//

import SwiftUI


struct School: Identifiable {
    let id = UUID()
    let name: String
    let location: String
}


struct PickSchoolView: View {
    @State private var searchText = ""
    @State private var selectedSchool: School?
    var userViewModel: UserViewModel
    
    let schools = [
        School(name: "Springfield High School", location: "Springfield, IL"),
        School(name: "Shelbyville High School", location: "Shelbyville, IL"),
        School(name: "Capital City High School", location: "Capital City, IL"),
        School(name: "San Francisco de Borja High School", location: "Lima, PE"),
        School(name: "Newton College", location: "Lima, PE"),
        School(name: "Markham College", location: "Lima, PE"),
        School(name: "Cambridge College", location: "Lima, PE"),
        School(name: "San Agustin High School", location: "Lima, PE"),
        School(name: "San Pedro High School", location: "Lima, PE"),
        School(name: "Carmelitas High School", location: "Lima, PE"),
        School(name: "Santa Maria High School", location: "Lima, PE"),
        School(name: "Villa Caritas High School", location: "Lima, PE")
    ]
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("🏫 Pick Your School")
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .frame(width: 324, height: 20, alignment: .center)
                    .font(
                        Font.custom("Swis721 BlkRnd BT", size: 23)
                            .weight(.black)
                    )
                
                
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search for your school", text: $searchText)
                        .font(
                            Font.custom("Swis721 BlkRnd BT", size: 15)
                                .weight(.black)
                        )
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(12)
                        .background(Color(.systemGray3))
                        .cornerRadius(18)
                }
                .padding()
                
                // List of schools
                List {
                    ForEach(schools.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }) { school in
                        ZStack {
                            NavigationLink(destination: NumberView(userViewModel: userViewModel)) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(school.name)
//                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .font(
                                            Font.custom("Swis721 BlkRnd BT", size: 15)
                                                .weight(.black)
                                        )
                                    Text(school.location)
//                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .font(
                                            Font.custom("Swis721 BlkRnd BT", size: 12)
                                        )
                                }
                                Spacer()
                                Circle()
                                    .stroke(Color.gray, lineWidth: 2)
                                    .frame(width: 20, height: 20)
                            }
                            .padding(.vertical, 8)
                            .background(Color.black)
                        }
                        .listRowBackground(Color.black)
//                        .background(Color.black)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.black)
                
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(false)
            
        }
        
    }
}

//#Preview {
//    PickSchoolView()
//}
