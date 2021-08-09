//  Created by Ryan Ferrell on 7/30/21.
//  Copyright © 2021 MbientLab. All rights reserved.
//

import SwiftUI

public class MWResetSVC: MWDetailResetVM, DetailResetVMDelegate, ObservableObject {

    public func refreshView() {
        self.objectWillChange.send()
    }

    public override init() {
        super.init()
        self.delegate = self
    }
}
