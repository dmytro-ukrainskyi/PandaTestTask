//
//  CustomButtonStyle.swift
//  PandaTestTask
//
//  Created by Dmytro Ukrainskyi on 29.09.2023.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    // MARK: Public Methods
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .font(.title2)
            .frame(
                maxWidth: .infinity,
                maxHeight: Constants.maxHeight
            )
            .padding(Constants.edgeInsets)
            .foregroundColor(Constants.foregroundColor)
            .opacity(
                configuration.isPressed
                ? Constants.opacityWhenPressed
                : Constants.defaultOpacity
            )
            .background(Constants.backgroundColor)
            .cornerRadius(Constants.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(
                        Constants.strokeColor,
                        lineWidth: Constants.strokeLineWidth
                    )
            )
    }
    
}

// MARK: - Constants

private extension CustomButtonStyle {
    
    enum Constants {
        
        static let maxHeight: CGFloat = 56
        static let cornerRadius: CGFloat = 18
        static let strokeLineWidth: CGFloat = 3
        
        static let edgeInsets: EdgeInsets = EdgeInsets(
            top: 0,
            leading: 5,
            bottom: 0,
            trailing: 5
        )
        
        static let defaultOpacity: CGFloat = 1
        static let opacityWhenPressed: CGFloat = 0.5
        
        static let foregroundColor: Color = .white
        static let backgroundColor: Color = .blue
        static let strokeColor: Color = .indigo
        
    }
    
}
