//
//  RssSourceDAOService.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - Protocol
public protocol IRssSourceDAOService {
    func loadRssSources() -> Single<[IRssSourceDomain]>
}

// MARK: - Class
public final class RssSourceDAOService: IRssSourceDAOService {
    
    public func loadRssSources() -> Single<[IRssSourceDomain]> {
        return Database.loadData(realmType: RssSourceRealmModel.self, filter: nil) { dao -> RssSourceModel in
            return RssSourceMapper.from(databaseModel: dao)
        }
    }
    
}
