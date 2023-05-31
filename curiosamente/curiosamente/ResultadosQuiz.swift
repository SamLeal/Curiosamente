//
//  Parabens.swift
//  AplicativoCuriosaMente
//
//  Created by Student24 on 29/04/23.
//

import SwiftUI

struct ResultadosQuiz: View {
    
    @State var scale = 1.0
    
   @State var cor : Tema
    
    var quizName : String
    var quizPoints : Stats
    @State var pointsBF : Int = 0
    @State var totalPoints : TotalStats = TotalStats(pontos: 0, totalQuizes: 0)
    
//    func setDef(){
//        let defaults = UserDefaults.standard
//        defaults.set( totalPoints.pontos + quizPoints.pontos, forKey: "TotalPoints")
//        defaults.set(totalPoints.totalQuizes + 1 , forKey: "TotalQuizes")
//    }
//    func getDef(){
//        let defaults = UserDefaults.standard
//        var points = TotalStats(
//            pontos: defaults.integer(forKey: "TotalPoints"),
//            totalQuizes: defaults.integer(forKey: "TotalQuizes"))
//    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                cor.backgroundColor.ignoresSafeArea()
                
                VStack {
                    Text(quizName)
                        .foregroundColor(cor.textColor)
                        .font(.custom("Fredoka One", size: 45))
                    Spacer()
                }
                
                VStack {
                    AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/7650/7650352.png")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        cor.auxColor.opacity(0.1)
                    }
                    .shadow(radius: 5)
                    .frame(width: 200, height: 200)
                    .scaleEffect(scale)
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1)
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        
                        withAnimation(repeated) {
                            scale = 0.6
                        }
                    }
                    
                    Text("Parabéns!")
                        .foregroundColor(cor.auxColor)
                        .font(.custom("Fredoka One", size: 45))
                        .shadow(color: cor.auxColor, radius: 5)
                    
                    VStack {
                        VStack(alignment: .leading) {
                            HStack {
                                HStack {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.green)
                                        .shadow(radius: 1)
                                    Text("Acertos:")
                                        .foregroundColor(cor.textColor)
                                    
                                }
                                Spacer()
                                Text("\(quizPoints.acertos)").frame(alignment: .trailing)
                                    .foregroundColor(cor.textColor)
                                
                                
                            }
                            HStack {
                                HStack {
                                    Image(systemName: "arrow.down")
                                        .foregroundColor(.red)
                                        .shadow(radius: 1)
                                    Text("Erros:")
                                        .foregroundColor(cor.textColor)
                                }
                                Spacer()
                                Text("\(quizPoints.erros)").frame(alignment: .trailing)
                                    .foregroundColor(cor.textColor)
                                
                            }
                        }
                        .font(.custom("Fredoka One", size: 24))
                        .frame(minWidth: 0, maxWidth: 220)
                        .padding()
                        .background(cor.detalhesColor)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                        Spacer()
                            .frame(height: 30)
                        HStack {
                            Image(systemName: "trophy.fill")
                                .font(.custom("Fredoka One", size: 22))
                            Text("\(pointsBF) + \(quizPoints.pontos)")
                                .font(.custom("Fredoka One", size: 24))
                        }
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    }
                    .padding(.top, 1)
                    
                }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: MenuCategorias(cor: cor)) {
                        Text("Menu")
                            .foregroundColor(cor.textColor)
                            .font(.custom("Fredoka One", size: 24))
                            
                    }
                    .padding()
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .background(cor.buttonColor)
                    .cornerRadius(10)
                    .padding()
                    .shadow(radius: 5)
                }
                .onAppear(){
                    
                    pointsBF = GLOBAL.pontos
                    
                    cor = GLOBAL.tema
                    
                    GLOBAL.pontos = GLOBAL.pontos + quizPoints.pontos
                    
                    
//                    let defaults = UserDefaults.standard
//
//                    totalPoints = TotalStats(
//                        pontos: defaults.integer(forKey: "TotalPoints"),
//                        totalQuizes: defaults.integer(forKey: "TotalQuizes"))
//
//                    print("points pre")
//                    print("\(quizPoints.pontos)   \(totalPoints.pontos)")
//
//                    let newPoints : Int = totalPoints.pontos + quizPoints.pontos
//                    print(newPoints)
//                    defaults.set(newPoints, forKey: "TotalPoints")
//                    defaults.set(totalPoints.totalQuizes + 1 , forKey: "TotalQuizes")
//                    print("points after")
//                    print(defaults.integer(forKey: "TotalPoints"))
                    
                }
            }
            
            
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct Parabens_Previews: PreviewProvider {
    static var previews: some View {
        ResultadosQuiz(cor: selectTema(tema: .tema2), quizName: "geografia", quizPoints: Stats(pontos: 9, erros: 2, acertos: 8), totalPoints: TotalStats(pontos: 2000, totalQuizes: 5))
    }
}
