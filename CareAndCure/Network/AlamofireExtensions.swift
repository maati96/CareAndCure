//
//  AlamofireExtensions.swift
//  Babo
//
//  Created by Vortex on 10/5/18.
//  Copyright © 2018 Vortex. All rights reserved.
//

import Foundation
import Alamofire

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        debugPrint("=======================================")
        #endif
        return self
    }
}
