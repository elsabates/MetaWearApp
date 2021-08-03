//  Created by Ryan Ferrell on 7/30/21.
//  Copyright © 2021 MbientLab. All rights reserved.
//

import Foundation
import MetaWear
import MetaWearCpp

public class MWDetailLEDVM: DetailIdentifiersVM {



    public var delegate: DetailLEDVMDelegate? = nil
    private weak var parent: DeviceDetailsCoordinator? = nil
    private weak var device: MetaWear? = nil

}

extension MWDetailLEDVM: DetailConfiguring {

    public func configure(parent: DeviceDetailsCoordinator, device: MetaWear) {
        self.parent = parent
        self.device = device
    }
}

extension MWDetailLEDVM {

    public func start() {
        updateState()
    }

    private func updateState() {
        guard let device = device else { return }



        delegate?.refreshView()
    }
}
