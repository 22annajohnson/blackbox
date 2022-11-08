//
//  SummaryView.swift
//  BlackBox
//
//  Created by Anna Johnson on 11/8/22.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Summary")
                    .bold()
                    .font(.system(size: 21.0))
            }
            Spacer()
                .frame(width: 1, height: 74, alignment: .bottom)
            VStack(alignment: .center){
                Button(action: {
                }) {
                    Text("Navigate to UIKit Screen")
                        .font(.system(size: 21.0))
                        .bold()
                        .frame(width: UIScreen.main.bounds.width, height: 10, alignment: .center)
                }
            }
            Spacer()
            .frame(width: 2, height: 105, alignment: .bottom)
        }.navigationBarHidden(true)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
