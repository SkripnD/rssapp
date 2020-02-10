//
//  RssSourceModel.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation

final class RssSourceModel: IRssSourceDomain {
    var id: String
    var url: String
    var updatedOn: TimeInterval
    
    init(id: String, url: String, updatedOn: TimeInterval) {
        self.id = id
        self.url = url
        self.updatedOn = updatedOn
    }
}
