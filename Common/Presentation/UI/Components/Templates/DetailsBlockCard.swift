//  Created by Ryan Ferrell on 7/31/21.
//  Copyright © 2021 MbientLab. All rights reserved.
//

import SwiftUI

struct DetailsBlockCard<Content: View>: View {

    @Environment(\.colorScheme) private var scheme
    var details: Namespace.ID

    init(group: DetailGroup, content: Content, namespace: Namespace.ID, width: CGFloat, showTitle: Bool = true) {
        self.title = group.title
        self.image = group.symbol.image()
        self.iconDescription = group.symbol.accessibilityDescription
        self.content = content
        self.tag = group.id
        self.details = namespace
        self.width = width
        self.showTitle = showTitle
    }

    init(title: String,
         image: Image,
         iconDescription: String,
         content: Content,
         tag: AnyHashable,
         namespace: Namespace.ID,
         width: CGFloat
    ) {
        self.title = title
        self.image = image
        self.iconDescription = iconDescription
        self.content = content
        self.tag = tag
        self.details = namespace
        self.width = width
        self.showTitle = true
    }

    init(title: String, symbol: SFSymbol, content: Content, tag: AnyHashable, namespace: Namespace.ID, width: CGFloat) {
        self.title = title
        self.image = symbol.image()
        self.iconDescription = symbol.accessibilityDescription
        self.content = content
        self.tag = tag
        self.details = namespace
        self.width = width
        self.showTitle = true
    }

    private var title: String
    private var content: Content
    private var image: Image
    private var iconDescription: String
    private var tag: AnyHashable
    private var width: CGFloat
    private var showTitle: Bool

    var body: some View {
        VStack(spacing: 1) {
            cardTitle
                .opacity(showTitle ? 1 : 0)

            content
                .frame(maxWidth: .infinity)
                .blockify()
        }
        .frame(width: width)
        .id(tag)
        .accessibilityElement(children: .contain)
        .accessibilitySortPriority(Double(DetailGroup.allCases.endIndex - (tag as? Int ?? 0)))
        .accessibilityLabel(title)
        .accessibilityLinkedGroup(id: "details", in: details)
    }


    private var cardTitle: some View {
        HStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: .detailsBlockHeaderIcon, height: .detailsBlockHeaderIcon)
                .accessibilityLabel(iconDescription)

            Text(title)
                .fontSmall(weight: scheme == .light ? .medium : .regular)
                .fixedSize(horizontal: true, vertical: false)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(Color.secondary)
        .padding(.horizontal, .detailBlockContentPadding + 5)
        .flipsForRightToLeftLayoutDirection(true)
        .accessibilityHidden(true)
    }
}

struct TitlelessDetailsBlockCard<Content: View>: View {

    var tag: AnyHashable
    var content: Content

    var body: some View {
        VStack(spacing: 4) {
            content
                .frame(maxWidth: .infinity)
                .blockify()
        }
        .frame(maxWidth: .infinity)
        .id(tag)
    }
}
