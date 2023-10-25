//
//  ContentView.swift
//  To-do
//
//  Created by Jakob Padtberg on 21.10.23.

import SwiftUI

struct Aufgabe: Identifiable {
    
    var id = UUID()
    var bezeichnug: String
    var erledigt = false
    
}

struct ContentView: View {
    
    
    @State var isBold = false
    @State var abstand = 0
    @State var neueAufgabe: String = ""
    @State var aufgaben: [Aufgabe] = []
    
    var body: some View {
        TabView {
            NavigationView {
                VStack{
                    List () {
                        ForEach(aufgaben.indices, id:\.self) { i in
                            
                            HStack{
                                Text(aufgaben[i].bezeichnug)
                                Spacer()
                                
                                Button(action: {
                                    if aufgaben[i].erledigt {
                                        aufgaben[i].erledigt = false
                                    }else{
                                        aufgaben[i].erledigt = true
                                    }
                                }, label: {
                                    if aufgaben[i].erledigt {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    } else {
                                        Image(systemName: "circle")
                                    }
                                })
                            }
                        }
                        .onDelete(perform: { offset in
                            aufgaben.remove(atOffsets: offset)
                        })
                    }
                    
                    
                    Spacer()
                    HStack {
                        TextField("Neue Aufgabe", text: $neueAufgabe)
                        Button("Hinzufügen") {
                            let aufgabe = Aufgabe(bezeichnug: neueAufgabe)
                            aufgaben.append(aufgabe)
                            neueAufgabe = ""
                        }
                    }
                    .tabItem {
                        Image (systemName: "list.bullet.clipboard")
                    }
                    
                    .padding(.horizontal, 30)
                    
                }
                .navigationTitle("Meine Aufgaben")
                
                }
            }
        }
    }

#Preview {
    ContentView()
}
