//
//  MainModel.swift
//  PandaTestTask
//
//  Created by Dmytro Ukrainskyi on 30.09.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    // MARK: Public Properties
    
    @Published
    private(set) var imageName: String = Images.panda
    
}
