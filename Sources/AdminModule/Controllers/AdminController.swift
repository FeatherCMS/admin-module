//
//  AdminController.swift
//  AdminModule
//
//  Created by Tibor Bodecs on 2020. 06. 09..
//

import FeatherCore

struct AdminController {

    func homeView(req: Request) throws -> EventLoopFuture<View> {
        req.leaf.render(template: "Admin/Home")
    }
}
