import SwiftUI

import Foundation

struct Quizes{
    
    
    
    
    static let animalQUIZdefault = Quiz(_id: "4", categoria: "Animais", descricao: "df animal quiz", pergResp: Quizes.AnimalQuizArray)
    
    static let dfAnimais = PergResp(
        pergunta: "Qual animal faz esse som ?",
        descricao: "O animal é um(a) ",
        respostaCorreta: "",
        respostasErradas: ["cachorro","cavalo","elefante","galinha","gato","golfinho","pato","vaca"])
    
    
    static let AnimalQuizArray = [
        PergResp(
            pergunta: "Qual animal faz esse som ?",
            descricao: "O animal é um ",
            respostaCorreta: "",
            respostasErradas: ["cachorro","cavalo","elefante","galinha","gato","golfinho","pato","vaca"])
    ]

    
    
    
    static let geoQUIZdefault = Quiz(_id: "1", categoria: "Geografia", descricao: "df quiz geo", pergResp: Quizes.GeoQuizArray)
    
    static let textQUIZdefault = Quiz(_id: "2", categoria: "historia", descricao: "df quiz hist", pergResp: Quizes.arrayRespostasHistoria)
    
    static let mathQUIZdefault = Quiz(_id: "3", categoria: "matematica", descricao: "def math quiz", pergResp: [PergResp(pergunta: "3 x 6", descricao: "multiplicacao", respostaCorreta: "18", respostasErradas: []),PergResp(pergunta: " 4 + 2", descricao: "soma", respostaCorreta: "6", respostasErradas: [])])
    
    
    
    
     var geoTemplate = PergResp(
            pergunta: "pergunta",
            descricao: "descricao",
            respostaCorreta: "resposta correta",
            respostasErradas: ["errada1",
                               "errada2"],
        region: Location(
            latitude: 0.0,
            longitude: 0.0,
            zoomPre: 0.05,
            zoomPos: 130
        ))
        
    static let dfGeoQuiz = PergResp(pergunta: "Qual é a região do brasil?", descricao: "Belo horizonte está localizado no sudeste do brazil", respostaCorreta: "Sudeste", respostasErradas: ["Nordeste", "Sul"],region: Location(latitude: -19.934433, longitude: -43.940387,zoomPre: 0.06,zoomPos: 130))
    
    static let dfMathQuiz = PergResp(pergunta: "5 x 6", descricao: "multiplicacao", respostaCorreta: "30", respostasErradas: [])
    
    static let dfTextQuiz = PergResp(
        pergunta: "Quem descobriu o Brasil?",
        descricao: "PA descobriu o brasil em 1500 enquanto procurava uma rota para india",
        respostaCorreta: "Pedro Alvares Cabral",
        respostasErradas: ["Pelé", "Dom Pedro II"])
    
    
    static let arrayRespostasHistoria = [
        PergResp(
            pergunta: "Quem descobriu o Brasil?",
            descricao: "PA descobriu o brasil em 1500 enquanto procurava uma rota para india",
            respostaCorreta: "Pedro Alvares Cabral",
            respostasErradas: ["Pelé", "Dom Pedro II", "Cristovão Colombo"]),
        PergResp(
            pergunta: "Que nome recebeu a lei que foi assinada pela princesa Isabel e que proibiu a escravidão no Brasil? ",
            descricao: "A Lei Áurea, em 13 de maio de 1888, foi a lei que extinguiu a escravidão no Brasil.",
            respostaCorreta: "Lei Áurea",
            respostasErradas: ["Lei dos Sexagenários", "Lei Eusébio de Queirós", "Lei Abolista"]),
        PergResp(
            pergunta: "O líder da Inconfidência Mineira, conhecido por Tiradentes, chamava-se:",
            descricao: "Joaquim José da Silva Xavier, mais conhecido como Tiradentes, foi um dentista, tropeiro, minerador, comerciante, militar e ativista político nascido no então Estado do Brasil, ainda uma colônia portuguesa, que atuou nas capitanias de Minas Gerais e Rio de Janeiro",
            respostaCorreta: "Joaquim José da Silva Xavier",
            respostasErradas: ["Eusébio de Queirós", "José Bonifácio", "Neymar Junior"]),
        PergResp(
            pergunta: "Quantos anos durou a Guerra dos Cem Anos?",
            descricao: "A guerra dos 100 anos foi um conflito entra França e Inglaterra que durou 116 anos",
            respostaCorreta: "116 anos",
            respostasErradas: ["110 anos", "100 anos", "98 anos"])]
    
    static let GeoQuizArray = [
 PergResp(pergunta: "Qual é a região do Brasil?",
                                   descricao: "Manaus está localizado no norte do Brasil, no estado do Amazonas",
                                   respostaCorreta: "Norte",
                                   respostasErradas: ["Nordeste", "Sul", "Sudeste", "Centro-Oeste"],region: Location(latitude: -3.121616, longitude: -60.022533,zoomPre: 0.06,zoomPos: 40)),
        PergResp(pergunta: "Qual é a região do Brasil?", descricao: "Belo horizonte está localizado no sudeste do Brasil, no estado de Minas Gerais", respostaCorreta: "Sudeste", respostasErradas: ["Nordeste", "Sul", "Norte", "Centro-Oeste"],region: Location(latitude: -19.934433, longitude: -43.940387,zoomPre: 0.06,zoomPos: 40)),
        PergResp(pergunta: "Qual é a região do Brasil?",
                                   descricao: "Natal está localizada no nordeste do Brasil, no estado do Rio Grande do Norte",
                                   respostaCorreta: "Nordeste",
                                   respostasErradas: ["Sudeste", "Sul", "Norte", "Centro-Oeste"],region: Location(latitude: -5.783652, longitude: -35.199379,zoomPre: 0.06,zoomPos: 40)),
         PergResp(pergunta: "Qual é a região do Brasil?",
                               descricao: "Belém está localizado no norte do Brasil, no estado do Pará",
                               respostaCorreta: "Norte",
                               respostasErradas: ["Nordeste", "Sul", "Sudeste", "Centro-Oeste"],region: Location(latitude: -1.458440, longitude: -48.501014,zoomPre: 0.06,zoomPos: 40)),
        PergResp(pergunta: "Qual é a região do Brasil?",
                               descricao: "Florianópolis está localizado no sul do Brasil, no estado de Santa Catarina",
                               respostaCorreta: "Sul",
                               respostasErradas: ["Nordeste", "Sudeste", "Norte", "Centro-Oeste"],region: Location(latitude: -27.593402, longitude: -48.556654,zoomPre: 0.06,zoomPos: 40)),
        PergResp(pergunta: "Qual é a região do Brasil?",
                               descricao: "Brasília está localizado no Centro-Oeste do Brasil, no distrito Federal",
                               respostaCorreta: "Centro-Oeste",
                               respostasErradas: ["Nordeste", "Sudeste", "Norte", "Sul"],region: Location(latitude: -15.796128, longitude: -47.890766,zoomPre: 0.06,zoomPos: 40))
    ]
    
}

struct Quiz: Codable{
    
    var _id : String
    var _rev : String?
    
    var categoria : String
    var descricao :String
    var pergResp : [PergResp]
    
}

struct PergResp : Codable{
    
    var pergunta : String
    var descricao : String
    var respostaCorreta : String
    var respostasErradas : [String]
    var region : Location?
}

struct Location : Codable{
    
    var latitude : Double
    var longitude : Double
    var zoomPre : Double
    var zoomPos : Double
    
}
struct TotalStats{
    var pontos : Int
    var totalQuizes : Int
    
}
struct Stats{
    var pontos : Int
    var erros : Int
    var acertos : Int
}


//auxiliar
struct Resposta{
    var string : String
    var isCorrect : Bool
}

class QuizClass{
    
}

class GeoQUiz : QuizClass{
    
}
