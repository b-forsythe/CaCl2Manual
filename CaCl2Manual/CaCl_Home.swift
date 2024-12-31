//
//  ContentView.swift
//  CaCl2Manual
//
//  Created by Brandon Forsythe on 6/4/24.
//
import SwiftUI

struct ContentView: View {
    @State var showTitle = true
    @State private var showInfo: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("PH3")
                    .resizable()
                    .aspectRatio(contentMode:.fill)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Image("ine")
                        .resizable()
                        .frame(width:160, height:160)
                    Spacer()
                        .frame(height:120)
                    ZStack(){
                        Image("bitmap_white")
                            .resizable()
                            .frame(width:350, height: 241.5, alignment: .center)
                        
                        Button(action: {
                            showInfo = true
                        }) {
                            Image(systemName: "questionmark.circle")
                                .resizable()
                                .foregroundColor(.black)
                                .bold()
                                .padding(8)
                                .frame(width:50, height:50)
                        }
                        .alert(isPresented: $showInfo) {
                            Alert(
                                title:Text("Calcium Chloride (CaCl2)"),
                                message:Text("Calcium Chloride is a salt similar to sodium chloride but tends to be stronger. \n\n It is typically used as a deicing / anti-icing chemical, as well as a dust pallative.\n\n Calcium Chloride, as a pallative, has a strong affinity for water. It will attach to moisture in the air or soil and hold it."),
                                dismissButton: .default(Text("Dismiss")))
                        }
                        .offset(x:145, y:-90)

                    }
                    Spacer()
                    HStack {
                        Spacer().frame(width:30)
                        NavigationLink(destination: CaCl_Instructions()) {
                            Image("instructions_white")
                                .resizable()
                                .frame(width:56, height:60)
                            Spacer().frame(width:30)
                        }
                        NavigationLink(destination: CaCl_Uses()) {
                            Image("uses_white")
                                .resizable()
                                .frame(width:56, height:60)
                            Spacer().frame(width:30)
                        }
                        NavigationLink(destination: CaCl_Calculator()) {
                            Image("calculator_white")
                                .resizable()
                                .frame(width:56, height:60)
                            Spacer().frame(width:30)
                        }
                        NavigationLink(destination: CaCl_Safety()) {
                            Image("safety_white")
                                .resizable()
                                .frame(width:56, height:60)
                            Spacer().frame(width:30)
                        }
                    }
                    
                }
                
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}


