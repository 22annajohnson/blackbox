//
//  HeartRate.swift
//  BlackBox
//
//  Created by Jacob  Loranger on 11/9/22.
//

import SwiftUI

struct HeartRateView: View {
    
    weak var navigationController: UINavigationController?
    
    
    var body: some View {
        
        VStack() {
            Text("Heart Rate")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        
        Divider()
        
        
        ScrollView{
            
            VStack{
                HStack {
                    Text("Graph")
                        .font(.title2)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding()
                }
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
        HeartRateView()
    }
}
