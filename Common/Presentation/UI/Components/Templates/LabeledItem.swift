//  Created by Ryan Ferrell on 7/31/21.
//  Copyright © 2021 MbientLab. All rights reserved.
//

import SwiftUI

struct LabeledItem<Content: View>: View {

    var label: String
    var content: Content
    var maxWidth: CGFloat = 100
    var alignment: VerticalAlignment = .firstTextBaseline
    var contentAlignment: Alignment = .leading

    var body: some View {
        HStack(alignment: alignment, spacing: 10) {
            Text(label)
                .fontSmall(weight: .medium)
                .foregroundColor(.secondary)

                .multilineTextAlignment(.leading)
                .frame(width: maxWidth, alignment: .leading)

            content
                .frame(maxWidth: .infinity, alignment: contentAlignment)
        }
    }
}

struct LabeledButtonItem<Content: View>: View {

    var label: String
    var content: Content
    var maxWidth: CGFloat = 100
    var alignment: VerticalAlignment = .firstTextBaseline
    var onTap: () -> Void

    var body: some View {
        HStack(alignment: alignment, spacing: 10) {
            Button(label) { onTap() }
                .fontSmall(weight: .medium)

                .multilineTextAlignment(.leading)
                .frame(width: maxWidth, alignment: .leading)

            content
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
