//
//  ContentView.swift
//  Sip_Calculator
//
//  Created by Bharath Kumar Potham Shetti on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    @State var monthlyInvestmentAmount = ""
    @State var investimentDuration = ""
    @State var expectedReturnRate = ""
    @State var result = ""
    var body: some View {
        VStack(spacing: 20) {
           Text("Sip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
           TextField("Monthly Investment", text: $monthlyInvestmentAmount)
                 .keyboardType(.decimalPad)
           TextField("Investment Duration", text: $investimentDuration)
                 .keyboardType(.decimalPad)
            TextField("Expected Return rate", text: $expectedReturnRate)
                 .keyboardType(.decimalPad)
                
            Button("Calculate"){
                calculateSip()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
             
            Text(result)
                .font(.headline)
          
           
        }
        .padding()
    }
    func calculateSip(){
        guard let investment = Double(monthlyInvestmentAmount),
              let duration = Double(investimentDuration),
              let returnRate = Double(expectedReturnRate) else{
            print("you enter the invalid")
            return
        }
        let monthlyRate = returnRate / (12 * 100)
        let months = duration * 12
        let futureValue = investment * ((pow(1 + monthlyRate, months) - 1) / monthlyRate) * (1 + monthlyRate)
       
        result = String(format: "Future Value: ₹%.2f", futureValue )
        
        
    }
}
#Preview {
    ContentView()
}
