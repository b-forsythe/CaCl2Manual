//
//  CaCl_Uses.swift
//  CaCl2Manual
//
//  Created by Brandon Forsythe on 6/4/24.
//

/* Uses
 ——
 Second most palliative besides water
 Cost-effectiveness
 Requires minimal equipment
 Eco-friendly and safe in moderation

 Applications
 ——————
 Topically applied
     (Liquid, solid)
 Mixed into soil
     (Liquid, solid)
 Application rate - 1 to 1.5% by weight

 Required Equipment
 —
 Solid
     (Grader, Spreader, Water Truck, Compactor.opt)
 Liquid
     (Grader, Water Truck, Compactor.opt, Forklift.opt)
*/

import SwiftUI

struct CaCl_Uses: View {
    var body: some View {
        Text("CaCl Uses")
            .bold()
            .underline()
            .font(.system(size:40, design: .rounded))
        
        HStack{
            Image("grader")
                .resizable()
                .frame(width:180, height:90)
            Image("watertruck")
                .resizable()
                .frame(width:195, height:90)
        }
        
        Spacer()

        
        VStack{
            Text("* Second most pallative beside water")
            Text("* Cost-effective")
            Text("* Requries minimal equipment")
            Text("* Eco-friendly and safe")
        }
        Spacer()
        
        VStack{
            Text("Topically Applied (Liquid, Solid)")
            Text("Mixed into Soil (Liquid, Solid")
            Text("Application Rate - 1 to 1.5% by weight")
        }
        Spacer()
        HStack{
        
            Image("compactor")
                .resizable()
                .frame(width:180, height:90)
            Image("spreader")
                .resizable()
                .frame(width:100, height:90)
                
        }
    }
}

#Preview {
    CaCl_Uses()
}
