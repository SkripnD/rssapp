//
//  RssSourceRealmModel.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import RealmSwift

public class RssSourceRealmModel: Object {
    @objc public dynamic var id: String!
    @objc public dynamic var url: String!
    @objc public dynamic var updatedOn: TimeInterval = 0

    public convenience init(id: String,
                            url: String,
                            updatedOn: TimeInterval) {
        self.init()

        self.id = id
        self.url = url
        self.updatedOn = updatedOn
    }

    override open class func primaryKey() -> String? {
        return "id"
    }
}
