//
//  DatabaseModel.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import RealmSwift

public protocol IDatabaseModel: Object {}

extension Object: IDatabaseModel {}
