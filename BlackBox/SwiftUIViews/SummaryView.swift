//
//  SummaryView.swift
//  BlackBox
//
//  Created by Anna Johnson on 11/8/22.
//

import SwiftUI

struct SummaryView: View {
    
    weak var navigationController: UINavigationController?

    
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
                    navigationController?.popViewController(animated: true)
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

//This code belongs in a UIKit ViewController

//        let label = UILabel()
//        label.text = "UIKit Screen"
//        label.textColor = .black
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .boldSystemFont(ofSize: 21)
//        view.addSubview(label)
//
//        let button = UIButton()
//        button.setTitleColor(.blue, for: .normal)
//        button.setTitle("Navigate to SwiftUI Screen", for: .normal)
//        button.titleLabel?.textAlignment = .center
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(openSwiftUIScreen), for: .touchUpInside)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 21)
//
//        view.addSubview(button)
//
//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 64)])
//    }

//    @objc func openSwiftUIScreen() {
//        let swiftUIViewController = UIHostingController(rootView: SummaryView(navigationController: self.navigationController))
//        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
//    }
