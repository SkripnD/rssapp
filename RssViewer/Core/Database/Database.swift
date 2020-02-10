//
//  Database.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

final public class Database {
    private static let realmConfiguration = Realm.Configuration(schemaVersion: 1,
                                                                migrationBlock: { migration, oldSchemaVersion in })
    
    public static func loadMaxObject<E, R: IDatabaseModel>(realmType: R.Type, filter: NSPredicate? = nil, map: @escaping (R) -> (E), compare: @escaping (E, E) -> Bool) -> Single<E?> {
        return Single.create { observer in
            
            guard let realm = try? Realm(configuration: Database.realmConfiguration) else {
                observer(.error(DatabaseError.notInitialization))
                return Disposables.create()
            }
            
            var results = realm.objects(R.self)
            if filter != nil {
                results = results.filter(filter!)
            }
            
            let max = results.max(by: { obj1, obj2 in
                compare(map(obj1), map(obj2))
            })
            
            if let obj = max {
                observer(.success(map(obj)))
            } else {
                observer(.success(nil))
            }
            
            return Disposables.create()
        }
        .subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: .background))
        .observeOn(MainScheduler.asyncInstance)
    }
    
    public static func loadData<E, R: IDatabaseModel>(realmType: R.Type, filter: NSPredicate? = nil, map: @escaping (R) -> (E)) -> Single<[E]> {
        return Single.create { observer in
            
            guard let realm = try? Realm(configuration: Database.realmConfiguration) else {
                observer(.error(DatabaseError.notInitialization))
                return Disposables.create()
            }
            
            var results = realm.objects(R.self)
            if filter != nil {
                results = results.filter(filter!)
            }
            
            let objects: [E] = results.map { obj -> E in
                return map(obj)
            }
            
            observer(.success(objects))
            
            return Disposables.create()
        }
        .subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: .background))
        .observeOn(MainScheduler.asyncInstance)
    }
    
    
}
