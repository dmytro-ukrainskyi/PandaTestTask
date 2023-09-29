//
//  DetailPandaView.swift
//  PandaTestTask
//
//  Created by Dmytro Ukrainskyi on 29.09.2023.
//

import SwiftUI

struct DetailPandaView: View {
    
    // MARK: Public Properties
    
    @Binding
    var isPresented: Bool
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                image(width: proxy.size.width,
                      height: proxy.size.height)
            }
            .ignoresSafeArea()
            
            GeometryReader { proxy in
                closeButton
                    .frame(
                        maxWidth: proxy.size.width,
                        maxHeight: proxy.size.height,
                        alignment: .topTrailing
                    )
                    .padding(Constants.defaultPadding)
            }
        }
    }
    
    // MARK: Components
    
    private func image(width: CGFloat,
                       height: CGFloat) -> some View {
        PandaImageView()
            .frame(
                width: width,
                height: height,
                alignment: .leading
            )
            .clipped()
    }
    
    private var closeButton: some View {
        Button {
            isPresented.toggle()
        } label: {
            Image(systemName: SystemImages.close)
                .frame(width: Constants.closeButtonSize,
                       height: Constants.closeButtonSize)
                .foregroundColor(Constants.closeButtonForegroundColor)
                .background(Constants.closeButtonBackgroundColor)
                .clipShape(Circle())
        }
    }
    
}

// MARK: - Constants

private extension DetailPandaView {
    
    enum Constants {
        
        static let closeButtonSize: CGFloat = 32
        static let closeButtonForegroundColor: Color = .white
        static let closeButtonBackgroundColor: Color = .gray
        
        static let defaultPadding: CGFloat = 20
        
    }
    
}

// MARK: - Preview

struct DetailPandaView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailPandaView(isPresented: .constant(true))
    }
    
}
