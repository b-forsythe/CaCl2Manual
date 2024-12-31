//
//  CaCl_Instructions.swift
//  CaCl2Manual
//
//  Created by Brandon Forsythe on 6/4/24.
//

import SwiftUI

struct CaCl_Instructions: View {
    @State private var isDryExpanded = false
    @State private var isWetExpanded = false
    @State private var isMixExpanded = false

    var body: some View {
        
        Text("CaCl Instructions")
            .bold()
            .underline()
            .font(.system(size:40, design: .rounded))
        
        
        Text("An ideal road has clearly defined project limits, drainage, and an established grade. \n\n If necessary, refresh surface course with 3/4 dense graded material, 8-15% passing 200 sieve. Ideally also have a 4'' thick surface for grading. \n\n Note: If you have slit or clean sand, calcium chloride is not a good choice.")
            .foregroundColor(Color.gray)
            .font(.system(size: 16))
            .padding()
        
        Spacer()
        
        VStack {
            DisclosureGroup("Steps to apply Solid Topical Application", isExpanded: $isDryExpanded) {
                Text(" 1. Shape Road \n 2. Compact \n 3. Loosen upper ~2 in. \n 4. Add Salt \n 5. Water \n 6. Compact ")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)
                    .padding(.vertical)
                Text("To Mix \n")
                    .padding(.vertical)
                    .bold()
                Text(" 1. Windrow to centerline \n 2. Add salt to windrow \n 3. Blend \n 4. Shape \n 5. Water \n 6. Compact")
                    .frame(maxWidth: .infinity, alignment:.leading)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .animation(.easeInOut, value: isDryExpanded)
            
            Spacer()
                .frame(height:100)
            
            DisclosureGroup("Steps for Topical Brine Application", isExpanded: $isWetExpanded) {
                Text(" 1. Shape Road \n 2. Apply Brine \n 3. Compact")
                    .padding()
                    .frame(maxWidth: .infinity, alignment:.leading)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .animation(.easeInOut, value: isWetExpanded)
            
            
            Spacer()
                .frame(height:100)
            
            DisclosureGroup("Steps for Mixed Brine Application", isExpanded: $isMixExpanded) {
                Text("* For depth of 2-4 inches")
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 12))
                
                Text(" 1. Loosen roadway to desired depth \n 2. Apply brine \n 3. Blend \n 4. Shape \n 5. Compact")
                    .padding()
                    .frame(maxWidth: .infinity, alignment:.leading)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .animation(.easeInOut, value: isMixExpanded)
        }
        .padding()
        
        Spacer()
        
    }
}

#Preview {
    CaCl_Instructions()
}
