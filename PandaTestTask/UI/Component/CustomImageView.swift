//
//  CustomImageView.swift
//  PandaTestTask
//
//  Created by Dmytro Ukrainskyi on 29.09.2023.
//

import SwiftUI

struct CustomImageView: View {
    
    // MARK: Public properties
    
    var image: Image
    
    // MARK: Body
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
    }
    
}

// MARK: - Preview

struct CustomImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomImageView(image: Image(Images.panda))
    }
    
}
