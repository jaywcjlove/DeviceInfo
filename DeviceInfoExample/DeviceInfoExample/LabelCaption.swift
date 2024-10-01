//
//  LabelCaption.swift
//  DeviceInfoExample
//
//  Created by 王楚江 on 2024/10/2.
//

import SwiftUI

@ViewBuilder func LabelCaption(
    condition: Bool = true,
    spacing: CGFloat? = nil,
    content: String = "",
    @ViewBuilder caption: () -> some View
) -> some View {
    VStack(alignment: .leading, spacing: spacing) {
        Text(content)
        if condition {
            Description {
                caption()
            }
        }
    }
}

@ViewBuilder fileprivate func Description(@ViewBuilder label: () -> some View) -> some View {
    label()
        .font(.caption)
        .foregroundStyle(.secondary)
}
