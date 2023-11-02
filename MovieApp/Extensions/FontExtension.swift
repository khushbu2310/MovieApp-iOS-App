//
//  FontExtension.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 27/10/23.
//

import Foundation
import UIKit

extension UIFont {
    static func interMedium(size: CGFloat) -> UIFont? {
        return UIFont(name: "Inter-Medium", size: size)
    }
    
    static func interLight(size: CGFloat) -> UIFont? {
        return UIFont(name: "Inter-Light", size: size)
    }
}
