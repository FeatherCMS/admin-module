//
//  AdminBuilder.swift
//  AdminModule
//
//  Created by Tibor Bodecs on 2020. 08. 23..
//

import FeatherCore

@_cdecl("createAdminModule")
public func createAdminModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(AdminBuilder()).toOpaque()
}

public final class AdminBuilder: ViperBuilder {

    public override func build() -> ViperModule {
        AdminModule()
    }
}
