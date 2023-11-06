//
//  LabelExtension.swift
//  MovieApp
//
//  Created by Khushbuben Patel on 05/11/23.
//

import Foundation
import UIKit

extension UILabel {
    
    func attachIconToLabel(image: UIImage, text: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        imageAttachment.bounds = CGRect(x: 0, y: -2, width: 15, height: 15)
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        
        let spaceString = NSAttributedString(string: String(repeating: " ", count: 2))
        attributedString.append(spaceString)
        
        let textAfterImageAttributedString = NSAttributedString(string: text)
        attributedString.append(textAfterImageAttributedString)

        self.attributedText = attributedString
    }
}
