//
//  LocalizableKey.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation

enum LocalizableKey {
    enum RssEmptySources: String {
        case header = "RssEmptySources_header"
        case addButton = "RssEmptySources_addButton"
    }
    enum RssSourcesAdd: String {
        case header = "RssSourcesAdd_header"
        case information = "RssSourcesAdd_information"
        case addButton = "RssSourcesAdd_addButton"
        case fieldPlaceholder = "RssSourcesAdd_fieldPlaceholder"
    }
}

extension RawRepresentable where RawValue == String {
    func localized() -> String {
        return rawValue.localized()
    }
}
