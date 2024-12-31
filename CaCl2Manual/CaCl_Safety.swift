//
//  CaCl_Safety.swift
//  CaCl2Manual
//
//  Created by Brandon Forsythe on 6/11/24.
//

import SwiftUI

struct CaCl_Safety: View {
    @State private var isHumanOpen = false
    @State private var isVehicleOpen = false
    var body: some View {
        Text("CaCl Safety")
            .bold()
            .underline()
            .font(.system(size:40, design: .rounded))
        Spacer()
            .frame(height:10)
        Image(systemName:"exclamationmark.circle")
            .resizable()
            .frame(width:100, height: 100)
        Spacer()
            .frame(height:20)
        
        Text("Calcium Chloride is a highly corrosive material to both people AND equipment. Please use the dropdown menus below to find out how to operate safely.")
            .foregroundColor(Color.gray)
            .font(.system(size: 16))
            .padding()
        
        Spacer()
        
        VStack {
            DisclosureGroup("Keeping People Safe", isExpanded: $isHumanOpen) {
                Text(" * Provide coveralls, gloves, safety vests and safety glasses to all workers. \n * Provide plenty of drinking water. \n * Provide showers at the end of the work shift.\n * Consider providing hand creams and body lotions.")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                    .padding(.vertical)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .animation(.easeInOut, value: isHumanOpen)
            
            Spacer()
                .frame(height:100)
            
            DisclosureGroup("Keeping Vehicles Safe", isExpanded: $isVehicleOpen) {
                Text("* All equipment should be thoroughly washed before and after shifts where calcium chloride is present \n * General maintenace is also recommended. Consider lubricating all machines more frequently than usual")
                    .padding()
                    .frame(maxWidth: .infinity, alignment:.leading)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .animation(.easeInOut, value: isVehicleOpen)
            
            
            Spacer()
                .frame(height:100)

        }
        .padding()
        
        Spacer()
        
    }
}

#Preview {
    CaCl_Safety()
}
