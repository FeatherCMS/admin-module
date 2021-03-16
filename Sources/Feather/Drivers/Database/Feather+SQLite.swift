//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 01. 29..
//

import FeatherCore
import FluentSQLiteDriver

extension Feather {

    /// use the sqlite database driver
    func useSQLiteDatabase() {
        let file = Application.Paths.resources
            .appendingPathComponent("db")
            .appendingPathExtension("sqlite")

        use(database: .sqlite(.file(file.path)), databaseId: .sqlite)
    }
}
