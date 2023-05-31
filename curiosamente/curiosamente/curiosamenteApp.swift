//
//  curiosamenteApp.swift
//  curiosamente
//
//  Created by Student02 on 28/04/23.
//

import SwiftUI

@main
struct curiosamenteApp: App {
    var body: some Scene {
        WindowGroup {
            Iniciar(cor: selectTema(tema: .tema1))
        }
    }
}
