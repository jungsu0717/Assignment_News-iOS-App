//
//  CGFloat.swift
//  Sample
//
//  Created by Julian on 5/26/24.
//

import Foundation
import UIKit

extension CGFloat {
    
    func pixelsToPoints() -> CGFloat {
        return self / UIScreen.main.scale
    }
}
