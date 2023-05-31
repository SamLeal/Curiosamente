//
//  Menu.swift
//  AplicativoCuriosaMente
//
//  Created by Student24 on 27/04/23.
//

import SwiftUI

struct MenuCategorias: View {
    

   @State var cor : Tema
    // Contador de pontos
    @State public var pontos = 0
    
    var body: some View {

        
        NavigationStack {
            ZStack {
                cor.backgroundColor.ignoresSafeArea()
                // Pontuação do usuário
                VStack {
//                    HStack {
//                        Image(systemName: "trophy.fill")
//                            .foregroundColor(cor.buttonColor)
//                            .font(.custom("Fredoka One", size: 32))
//                            .shadow(radius: 5)
//                        
//                        Text("\(GLOBAL.pontos)")
//                            .foregroundColor(cor.buttonColor)
//                            .font(.custom("Fredoka One", size: 28))
//                            .shadow(radius: 5)
//                    }
//                    .ignoresSafeArea()
//                    .padding(.trailing, 20)
//                    .padding(.top, 10)
//                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    
                    Text("CATEGORIAS")
                        .foregroundColor(cor.textColor)
                        .font(.custom("Fredoka One", size: 36))
                    
                    Spacer()
                }
                
                // Navegação entre disciplinas
                VStack {
                    
                    HStack {
                        // Idiomas
                        NavigationLink(destination: MenuText(cor: cor)) {
                            Image(systemName: "character.bubble.ja")
                                .foregroundColor(cor.textColor)
                                .font(.custom("Fredoka One", size: 72))
                        }
                        .padding()
                        .frame(width: 130, height: 130)
                        .background(cor.buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                        
                        // Geografia
                        NavigationLink(destination: MenuGeo(cor: cor)) {
                            Image(systemName: "globe.asia.australia")
                                .foregroundColor(cor.textColor)
                                .font(.custom("Fredoka One", size: 78))
                        }
                        .padding()
                        .frame(width: 130, height: 130)
                        .background(cor.buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                    }
                    
                    HStack {
                        // Matemática
                        NavigationLink(destination: MenuMath(cor: cor) ) {
                            Image(systemName: "plus.forwardslash.minus")
                                .foregroundColor(cor.textColor)
                                .font(.custom("Fredoka One", size: 62))
                        }
                        .padding()
                        .frame(width: 130, height: 130)
                        .background(cor.buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                        
                        // Animais
                        NavigationLink(destination: MenuMath(cor: cor)) {
                            Image(systemName: "tortoise")
                                .foregroundColor(cor.textColor)
                                .font(.custom("Fredoka One", size: 62))
                        }
                        .padding()
                        .frame(width: 130, height: 130)
                        .background(cor.buttonColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                    }
                    
                    // Loja Temas
                    NavigationLink(destination: LojaTemas(tema: cor) ) {
                        Image(systemName: "paintpalette")
                            .foregroundColor(cor.textColor)
                            .font(.custom("Fredoka One", size: 62))
                    }
                    .padding()
                    .frame(width: 130, height: 130)
                    .background(cor.buttonColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                    .onAppear(){
                        cor = GLOBAL.tema
                    }
                    
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategorias(cor: selectTema(tema: .temadf))
    }
}
