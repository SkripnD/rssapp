//
//  IRssSourceDomain.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//
import Foundation

public protocol IRssSourceDomain: IDomain {
    var id: String {get set}
    var url: String {get set}
    var updatedOn: TimeInterval {get set}
    
    init(id: String, url: String, updatedOn: TimeInterval)
}
