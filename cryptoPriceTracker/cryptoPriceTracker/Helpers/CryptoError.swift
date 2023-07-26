//
//  CryptoError.swift
//  cryptoPriceTracker
//
//  Created by russell gadsden on 7/22/23.
//

import Foundation


enum CryptoError: LocalizedError {
   case invalidURL
   case thrownError(Error)
   case noData
    
}
