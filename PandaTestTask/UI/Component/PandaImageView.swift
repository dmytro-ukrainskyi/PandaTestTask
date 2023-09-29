//
//  PandaImageView.swift
//  PandaTestTask
//
//  Created by Dmytro Ukrainskyi on 29.09.2023.
//

import SwiftUI

struct PandaImageView: View {
    
    // MARK: Body
    
    var body: some View {
        Image(Images.panda)
            .resizable()
            .scaledToFill()
    }
    
}

// MARK: - Preview

struct PandaImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        PandaImageView()
    }
    
}
