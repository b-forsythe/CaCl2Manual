//
//  CaCl_Calculator.swift
//  CaCl2Manual
//
//  Created by Brandon Forsythe on 7/22/24.
//


import SwiftUI

struct CaCl_Calculator: View {
    @State private var pearl: Bool = false
    @State private var powder: Bool = false
    @State private var liquid: Bool = false
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var depth: String = ""
    @State private var concentration: String = ""
    @State private var weightOfSoil: String = ""
    @State private var applicationRate: String = ""
    @State private var selection = "Form"
    
    @State private var volumeOfSoil: Double = 0.0
    @State private var weightOfSoilCalculated: Double = 0.0
    @State private var weightOfCalciumChloride: Double = 0.0
    @State private var weightOfCalciumChlorideExtra: Double = 0.0
    @State private var bagsToBuy: Double = 0.0
    @State private var superBagsToBuy: Double = 0.0
    
    let options = ["Material Form", "Pellets", "Flakes", "Liquid"]
    
    var body: some View {
        VStack {
            
            Picker("Select Please", selection: $selection){
                ForEach(options, id: \.self){
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            .overlay(RoundedRectangle(cornerRadius:10)
                .stroke(Color.blue, lineWidth:2))
            

            
            InputField(title: "Length (ft)", value: $length)
            Spacer().frame(height: 20)
            
            InputField(title: "Width (ft)", value: $width)
            Spacer().frame(height: 20)
            
            InputFieldWithInfo(title: "Depth of treatment (inches)", value: $depth, infoText: "How deep the layer of Chloride will be placed")
            Spacer().frame(height: 20)
            
            InputFieldWithInfo(title: "Weight of soil (lb/cy)", value: $weightOfSoil, infoText: "Using a 5 gallon bucket fill with three equal lifts, compacting each lift with 50 blows. You can use a 2x4 to compact the soil.\n\n Weigh the bucket on a bathroom scale. \n\n A 5 gallon bucket contains 0.67 cubic feet or of volume. \n\n Compute the weight of a cubic yard with the following equation. \n\n Wt./c.y. = (wt. of bucket/0.67) x 27")
            Spacer().frame(height: 20)
            if(selection != "Liquid"){
                InputFieldWithInfo(title: "Application rate (%)", value: $applicationRate, infoText: "Application rate is the percentage of the material applied.\n\n NOTE: This is typically between 1-1.5% It is also recommended to add 10% extra just in case.")
                Spacer().frame(height: 20)
            }
            if(selection == "Liquid"){
                InputFieldWithInfo(title: "Concentration (% decimal)", value: $concentration, infoText: "Concentration is the amount of liquid brine to be added to the dirt mix. \n\n This is typically 38%, 35% or 32%")
                Spacer().frame(height: 20)
            }
            
            Button(action: calculate) {
                Text("Calculate")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Text("Volume of Soil: \(volumeOfSoil, specifier: "%.2f") cy")
                .padding(1)
            Text("Weight of Soil: \(weightOfSoilCalculated, specifier: "%.2f") lb")
                .padding(1)
            Text("Weight of Calcium Chloride: \(weightOfCalciumChloride, specifier: "%.2f") lb")
                .padding(1)
            Text("Weight of CaCl + 10%: \(weightOfCalciumChlorideExtra, specifier: "%.2f") lb")
                .padding(1)
            if selection == "Flakes" || selection == "Pellets" {
                Text("Number of Bags to Buy \(selection == "Pellets" ? "(80" : "(100") lbs): \(ceil(bagsToBuy), specifier: "%.1f")")
                    .padding(1)
                Text("Number of Super Sacks to Buy: \(ceil(superBagsToBuy), specifier:"%.1f")")
            }
            if selection == "Liquid" {
                Text("Number of gallons needed : \(bagsToBuy, specifier: "%.2f")")
                    .padding(1)
            }
        }
        .padding()
    }
    
    func calculate() {
        guard let length = Double(length),
              let width = Double(width),
              let depth = Double(depth),
              let weightOfSoil = Double(weightOfSoil) else {
                  return
              }
              let concentrationValue = Double(concentration) ?? 0.0
              let applicationRateValue = Double(applicationRate) ?? 0.0
        
        // Compute volume of soil
        volumeOfSoil = (length * width * (depth / 12)) / 27
        
        // Compute weight of soil
        weightOfSoilCalculated = volumeOfSoil * weightOfSoil
        
        // Compute weight of calcium chloride to order
        weightOfCalciumChloride = (applicationRateValue * 0.01) * weightOfSoilCalculated
        
        weightOfCalciumChlorideExtra = (weightOfCalciumChloride + (0.1 * weightOfCalciumChloride))
        
        switch selection {
        case "Flakes":
            bagsToBuy = ((length * width) * applicationRateValue) / 100
        case "Liquid":
            bagsToBuy = ((length * width) * concentrationValue)
        case "Pellets":
            bagsToBuy = ((length * width) * applicationRateValue) / 80
        default:
            bagsToBuy = 0.0
        }
        
        superBagsToBuy = (length * width) * applicationRateValue / 2000
    }
}

struct InputField: View {
    var title: String
    @Binding var value: String
    
    var body: some View {
        TextField(title, text: $value)
            .padding()
            .keyboardType(.decimalPad)
            .border(Color.gray)
            .frame(width: 300)
    }
}

struct InputFieldWithInfo: View {
    var title: String
    @Binding var value: String
    @State private var showInfo: Bool = false
    var infoText: String = ""
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextField(title, text: $value)
                .padding()
                .keyboardType(.decimalPad)
                .border(Color.gray)
            
            Button(action: {
                showInfo = true
            }) {
                Image(systemName: "questionmark.circle")
                    .foregroundColor(.blue)
                    .padding(8)
            }
        }
        .frame(width: 300)
        .alert(isPresented: $showInfo) {
            Alert(title: Text(title), message: Text(infoText), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    CaCl_Calculator()
}



