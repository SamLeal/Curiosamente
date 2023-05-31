//
//  Iniciar.swift
//  curiosamente
//
//  Created by Student02 on 28/04/23.
//

import SwiftUI

struct Iniciar: View {
    
    @State  var cor : Tema
    
    var body: some View {
        NavigationStack{
            ZStack {
                cor.backgroundColor.ignoresSafeArea()
                
                VStack{
                    VStack(alignment: .trailing) {
                        Text("Curiosa")
                            .foregroundColor(cor.textColor)
                            .shadow(color: cor.detalhesColor, radius: 5)
                            .font(.custom("Fredoka One", size: 72))
                        Text("Mente")
                            .foregroundColor(cor.textColor)
                            .multilineTextAlignment(.trailing)
                            .shadow(color: cor.detalhesColor, radius: 5)
                            .font(.custom("Fredoka One", size: 72))
                    }
                    
                    Spacer()
                    
                    AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/7650/7650334.png")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.purple.opacity(0.1)
                    }
                    .frame(width: 200, height: 300)
                    
                    Spacer()
                    
                    NavigationLink(destination: MenuCategorias(cor: cor)) {
                        Text("Começar!")
                            .foregroundColor(cor.textColor)
                            .font(.custom("Fredoka One", size: 24))
                    }
                    .padding()
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .background(cor.buttonColor)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                }.padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(){
//            let defaults = UserDefaults.standard
//
////            var firstTime = true
////
////            firstTime  = defaults.bool(forKey: "firstTime")
////
////            if(firstTime){
////                defaults.set(selectTema(tema: .temadf), forKey: "Tema")
////
////            }
////            print("end defaults inicio")
//
//            cor = (defaults.object(forKey: "Tema") as! Tema? ?? selectTema(tema: .temadf))
//            print(cor.nomeTema)
            
            cor = GLOBAL.tema
            
        }
        
    }

    }


struct Iniciar_Previews: PreviewProvider {
    static var previews: some View {
        Iniciar(cor: selectTema(tema: .tema3))
    }
}
