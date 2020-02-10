//
//  RssUrlValidationError.swift
//  RssViewer
//
//  Created by Denis on 08/02/2020.
//  Copyright © 2020 DS. All rights reserved.
//

import Foundation
import Validator

public class RssAddValidationError: ValidationError {
    
    enum ErrorType {
        case rssWrongUrl
        case unknown
    }
    
    private let errorType: ErrorType
    
    init(errorType: ErrorType) {
        self.errorType = errorType
    }
    
    public var message: String {
        switch self.errorType {
        case .rssWrongUrl:
            return ""
        case .unknown:
            return ""
        }
    }
}
