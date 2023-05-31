//
//  MenuGeo.swift
//  curiosamente
//
//  Created by Student02 on 09/05/23.
//

import SwiftUI

struct MenuText: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    
    
   @State var cor : Tema
    
    //var quizArray: [Quiz]
    
   @StateObject var model = QuizModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                cor.backgroundColor.ignoresSafeArea()
                VStack{
                    Text("Quizes Gerais")
                        .font(.largeTitle)
                        .padding()
                        .background(cor.detalhesColor)
                        .cornerRadius(15)
                        .foregroundColor(cor.textColor)
                        
                    ScrollView{
                        LazyVGrid(columns: columnLayout){
                            ForEach(model.questions, id: \._id){ q in
                                NavigationLink(destination : {
                                    
                                    TextQuiz(cor: cor, quiz: q)
                                    
                                }){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25)
                                            .aspectRatio(1.0,contentMode: ContentMode.fit)
                                            .foregroundColor(cor.buttonColor)
                                        VStack{
                                            Text("\(q.categoria)")
                                                .font(.title)
                                                .foregroundColor(cor.textColor)
                                        }
                                    }
                                    
                                }
                            }.padding(5)
                        }
                    }
                    .padding()
                    .onAppear(){
                        model.fetch(codigo: "quiz/txt")
                        cor = GLOBAL.tema  
                    }
                }
            }
        }
    }
}
    struct MenuText_Previews: PreviewProvider {
        static var previews: some View {
            MenuText(cor: selectTema(tema: .temadf))
        }
    }

