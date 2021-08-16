//  Created by Ryan Ferrell on 7/31/21.
//  Copyright © 2021 MbientLab. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    var scrollProxy: ScrollViewProxy? {
        get { return self[ScrollViewProxyKey.self] }
        set { self[ScrollViewProxyKey.self] = newValue }
    }

    var hasUserFocus: Bool {
        get { return self[HasUserFocusKey.self] }
        set { self[HasUserFocusKey.self] = newValue }
    }

    var fontFace: FontFace {
        get { return self[FontFaceKey.self] }
        set { self[FontFaceKey.self] = newValue }
    }

    var keyboardIsShown: Bool {
        get { return self[KeyboardIsShownEVK.self] }
        set { self[KeyboardIsShownEVK.self] = newValue }
    }
}

private struct ScrollViewProxyKey: EnvironmentKey {
    static let defaultValue: ScrollViewProxy? = nil
}

private struct HasUserFocusKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

private struct FontFaceKey: EnvironmentKey {
    static let defaultValue: FontFace = .system
}

private struct KeyboardIsShownEVK: EnvironmentKey {
    static let defaultValue: Bool = false
}
