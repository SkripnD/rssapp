//
//  RssSourceMapper.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation

final class RssSourceMapper: IDatabaseMapper {
    typealias DatabaseModel = RssSourceRealmModel
    typealias DomainModel = RssSourceModel
    
    static func from(databaseModel model: RssSourceRealmModel) -> RssSourceModel {
        let model = RssSourceModel(id: model.id,
                                   url: model.url,
                                   updatedOn: model.updatedOn)
        
        return model
    }
    
}
