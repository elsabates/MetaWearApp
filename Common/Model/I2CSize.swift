//  Created by Ryan Ferrell on 7/31/21.
//  Copyright © 2021 MbientLab. All rights reserved.
//

import Foundation

public enum I2CSize: Int, CaseIterable {
    case byte
    case word
    case dword

    public var length: UInt8 {
        switch self {
            case .byte: return 1
            case .word: return 2
            case .dword: return 4
        }
    }
}
