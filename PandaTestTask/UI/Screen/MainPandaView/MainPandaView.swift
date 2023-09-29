//
//  MainPandaView.swift
//  PandaTestTask
//
//  Created by Dmytro Ukrainskyi on 28.09.2023.
//

import SwiftUI

struct MainPandaView: View {
    
    // MARK: Private Properties
    
    @State
    private var isOpenFromTopButtonDisabled: Bool = false
    
    @State
    private var isDetailViewPresented: Bool = false
    
    // MARK: Body
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                image(screenHeight: proxy.size.height)
                
                HStack(spacing: Constants.defaultPadding) {
                    lockButton
                    
                    openFromTopButton
                }
                
                Spacer()
                
                openFullButton
            }
            .padding(Constants.defaultPadding)
            .background(Constants.backgroundColor)
            .overlay(isDetailViewPresented
                     ? detailView
                     : nil
            )
        }
    }
    
    // MARK: Components
    
    private var detailView: some View {
        DetailPandaView(isPresented: $isDetailViewPresented.animation())
            .transition(.move(edge: .top))
    }
    
    private func image(screenHeight: CGFloat) -> some View {
        PandaImageView()
            .frame(
                width: Constants.imageWidth,
                height: screenHeight
                  * Constants.imageHeightToScreenHeightRatio,
                alignment: .leading
            )
            .clipped()
    }
    
    private var lockButton: some View {
        Button {
            isOpenFromTopButtonDisabled.toggle()
        } label: {
            isOpenFromTopButtonDisabled
            ? Text("Unlock")
            : Text("Lock")
        }
        .buttonStyle(CustomButtonStyle())
    }
    
    private var openFromTopButton: some View {
        Button("Open from top") {
            withAnimation {
                isDetailViewPresented.toggle()
            }
        }
        .buttonStyle(CustomButtonStyle())
        .disabled(isOpenFromTopButtonDisabled)
        .opacity(
            isOpenFromTopButtonDisabled
            ? Constants.disabledButtonOpacity
            : Constants.defaultButtonOpacity
        )
    }
    
    private var openFullButton: some View {
        Button("Open full") {
        }
        .buttonStyle(CustomButtonStyle())
    }
    
}

// MARK: - Constants

private extension MainPandaView {
    
    enum Constants {
        
        static let imageWidth: CGFloat = 150
        static let imageHeightToScreenHeightRatio: CGFloat = 0.3
        
        static let defaultButtonOpacity: CGFloat = 1
        static let disabledButtonOpacity: CGFloat = 0.5
        
        static let defaultPadding: CGFloat = 20
        
        static let backgroundColor = Color.gray
        
    }
    
}

// MARK: - Preview

struct MainPandaView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainPandaView()
    }
    
}
