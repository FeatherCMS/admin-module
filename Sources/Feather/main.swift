//
//  main.swift
//  Feather
//
//  Created by Tibor Bodecs on 2019. 12. 17..
//

import FeatherCore

import SystemModule
import CommonModule
import UserModule
import ApiModule
import FrontendModule
import AdminModule

/// setup metadata delegate object
Feather.metadataDelegate = FrontendMetadataDelegate()

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let feather = try Feather(env: env)
defer { feather.stop() }

feather.useSQLiteDatabase()
feather.useLocalFileStorage()
feather.usePublicFileMiddleware()

try feather.configure([
    SystemBuilder(),
    CommonBuilder(),
    UserBuilder(),
    ApiBuilder(),
    FrontendBuilder(),

    AdminBuilder(),
])

if feather.app.isDebug {
    try feather.resetPublicFiles()
    try feather.copyTemplatesIfNeeded()
}

try feather.start()
