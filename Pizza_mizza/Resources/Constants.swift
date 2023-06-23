//
//  Constants.swift
//  Pizza_mizza
//
//  Created by Artem on 22.06.2023.
//

import Foundation

enum Constants {
    enum Constraints {
        static var headerHeight = 112
        static var rowOnTableHeight = 180
        
        enum MainCell {
            static var top: CGFloat = 24
            static var bot: CGFloat = -24
            static var leading: CGFloat = 16
            static var trailing: CGFloat = -16

            static var imageHeight: CGFloat = 132
            static var imageWidth: CGFloat = 132
            
            static var betweenelements: CGFloat = 20
        }
    }
}
