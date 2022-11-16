//
//  HeartRate.swift
//  BlackBox
//
//  Created by Jacob  Loranger on 11/9/22.
//

import SwiftUI
import Charts

struct SensorView: View {
    
    weak var navigationController: UINavigationController?
    var title: String
    var indicator: String
    @State private var animationAmount = 1.0
    
    
    var body: some View {
        
//        Adds titles and indicator images
        HStack() {
            Text(title)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            if indicator == "Healthy" {
                Image(systemName: "checkmark.circle").foregroundColor(.green)
                    .font(.system(size: 40.0, weight: .bold))
                    .padding(25)
            }
            if indicator == "Warning" {
                Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.yellow)
                    .font(.system(size: 40.0, weight: .bold))
                    .padding(25)
            }
            if indicator == "Unhealthy" {
                Image(systemName: "exclamationmark.octagon.fill").foregroundColor(.red)
                    .font(.system(size: 40.0, weight: .bold))
                    .padding(25)
                    .overlay(
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                            .animation(
                                .easeOut(duration: 1)
                                    .repeatForever(autoreverses: false),
                                value: animationAmount
                            )
                    )
                    .onAppear {
                        animationAmount = 2
                    }
                
            }
        }
        
        ScrollView{
            
            
            Divider()
            
            VStack{
                HStack {
                    Text("Graph")
                        .font(.title2)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding()
      
                }
                HStack(alignment: .center, spacing: 0){
                    Text("Y-Values")
                        .rotationEffect(Angle(degrees: -90))
                        .font(.system(size: 10))
                    Chart(SalesData.last30Days, id: \.day) {
                        LineMark(
                            x: .value("Day", $0.day, unit: .day),
                            y: .value("Sales", $0.sales)
                        )
                    }.frame(height: 200)

                }
                
                Text("Time")
                    .font(.system(size: 10))
            }
            
            Divider()
            
            VStack{
                HStack {
                    Text("Statistics")
                        .font(.title2)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
            }
                
            
        }
    }
}


//
//        VStack {
//            HStack {
//                Text("Summary")
//                    .bold()
//                    .font(.system(size: 21.0))
//            }
//            Spacer()
//                .frame(width: 1, height: 74, alignment: .bottom)
//            VStack(alignment: .center){
//                Button(action: {
//                    navigationController?.popViewController(animated: true)
//                }) {
//                    Text("Navigate to UIKit Screen")
//                        .font(.system(size: 21.0))
//                        .bold()
//                        .frame(width: UIScreen.main.bounds.width, height: 10, alignment: .center)
//                }
//            }
//            Spacer()
//            .frame(width: 2, height: 105, alignment: .bottom)
//        }.navigationBarHidden(true)


struct HeartRateView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView(title: "test", indicator: "test")
    }
}
