//
//  String-Extension.swift
//  Posts
//
//  Created by Sargis Kocharyan on 5/31/21.
//

import Foundation

extension String  {
    func localized() ->String {
        let lang = "en"
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }}
