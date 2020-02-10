//
//  String+Localized.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation

extension String {

    public func localized() -> String {
        return self.localized(bundle: Bundle.main)
    }
    
    public func localized(bundle: Bundle) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
}
