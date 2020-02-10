//
//  IDatabaseMapper.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation

public protocol IDatabaseMapper {
    associatedtype DatabaseModel: IDatabaseModel
    associatedtype DomainModel: IDomain
    
    static func from(databaseModel: DatabaseModel) -> DomainModel
}
