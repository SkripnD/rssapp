//
//  RssItemRealmModel.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import RealmSwift

public class RssItemRealmModel: Object {
    @objc public dynamic var id: String!
    @objc public dynamic var rssSource: RssSourceRealmModel!
    
    public convenience init(id: String, rssSource: RssSourceRealmModel) {
        self.init()
        
        self.id = id
        self.rssSource = rssSource
    }
    
    override open class func primaryKey() -> String? {
        return "id"
    }
}
