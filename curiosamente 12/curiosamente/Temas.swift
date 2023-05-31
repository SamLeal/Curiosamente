//
//  Temas.swift
//  curiosamente
//
//  Created by Student02 on 28/04/23.
//

import Foundation
import SwiftUI


struct GLOBAL {
    static var tema : Tema = selectTema(tema: .temadf)
    static var pontos : Int = 1000
    
    static var prefix : String = "http://127.0.0.1:1880/"
}


struct Tema{
    let textColor : Color
    let backgroundColor : Color
    let buttonColor : Color
    let detalhesColor : Color
    let auxColor : Color
    
    
    let nomeTema : String
    let descricaoTema : String
    let preco : Int
}

enum EnumTemas : CaseIterable {
    case temadf
    case tema1
    case tema2
    case tema3
    case tema4
    case tema5
    case tema6
    case tema7
    case tema8
    case tema9
    case tema0
}


func selectTema(tema: EnumTemas) -> Tema{
    
    switch tema {
    case .temadf:
        return Tema(
            textColor: .white,
            backgroundColor: .cyan,
            buttonColor: .blue,
            detalhesColor: .pink,
            auxColor: .purple,
            nomeTema: "Apolo",
            descricaoTema: "Deus da música, da poesia e da avivinhação.",
            preco: 150)
    case .tema1:
        return Tema(
            textColor: Color("tex1"),
            backgroundColor: Color("bac1"),
            buttonColor: Color("but1"),
            detalhesColor: Color("det1"),
            auxColor: Color("aux1"),
            nomeTema: "Carmenta",
            descricaoTema: "Deusa das fontes e das profecias.",
            preco: 300)
    case .tema2:
        return Tema(
            textColor: Color("tex2"),
            backgroundColor: Color("bac2"),
            buttonColor: Color("but2"),
            detalhesColor: Color("det2"),
            auxColor: Color("aux2"),
            nomeTema: "Ceres",
            descricaoTema: "Deusa dos frutos e da terra.",
            preco: 450)
    case .tema3:
        return Tema(
            textColor: Color("tex3"),
            backgroundColor: Color("bac3"),
            buttonColor: Color("but3"),
            detalhesColor: Color("det3"),
            auxColor: Color("aux3"),
            nomeTema: "Fauno",
            descricaoTema: "Deus da fecundidade e dos animais.",
            preco: 600)
    case .tema4:
        return Tema(
            textColor: Color("tex4"),
            backgroundColor: Color("bac4"),
            buttonColor: Color("but4"),
            detalhesColor: Color("det4"),
            auxColor: Color("aux4"),
            nomeTema: "Júpiter",
            descricaoTema: "Rei dos deuses e protetor de Roma.",
            preco: 750)
    case .tema5:
        return Tema(
            textColor: Color("tex5"),
            backgroundColor: Color("bac5"),
            buttonColor: Color("but5"),
            detalhesColor: Color("det5"),
            auxColor: Color("aux5"),
            nomeTema: "Marte",
            descricaoTema: "Deus das colheitas e da guerra.",
            preco: 900)
    case .tema6:
        return Tema(
            textColor: Color("tex6"),
            backgroundColor: Color("bac6"),
            buttonColor: Color("but6"),
            detalhesColor: Color("det6"),
            auxColor: Color("aux6"),
            nomeTema: "Minerva",
            descricaoTema: "Protetora do comércio e das indústrias.",
            preco: 1050)
    case .tema7:
        return Tema(
            textColor: Color("tex7"),
            backgroundColor: Color("bac7"),
            buttonColor: Color("but7"),
            detalhesColor: Color("det7"),
            auxColor: Color("aux7"),
            nomeTema: "Netuno",
            descricaoTema: "Deus do mar e das tempestades.",
            preco: 1200)
    case .tema8:
        return Tema(
            textColor: Color("tex8"),
            backgroundColor: Color("bac8"),
            buttonColor: Color("but8"),
            detalhesColor: Color("det8"),
            auxColor: Color("aux8"),
            nomeTema: "Plutão",
            descricaoTema: "Deus do submundo.",
            preco: 1350)
    case .tema9:
        return Tema(
            textColor: Color("tex9"),
            backgroundColor: Color("bac9"),
            buttonColor: Color("but9"),
            detalhesColor: Color("det9"),
            auxColor: Color("aux9"),
            nomeTema: "Saturno",
            descricaoTema: "Deus das sementeiras.",
            preco: 1500)
    case .tema0:
        return Tema(
            textColor: Color("tex10"),
            backgroundColor: Color("bac10"),
            buttonColor: Color("but10"),
            detalhesColor: Color("det10"),
            auxColor: Color("aux10"),
            nomeTema: "Vesta",
            descricaoTema: "Deusa do lar e do fogo.",
            preco: 1650)
    }
      

}
