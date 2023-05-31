//
//  ViewModel.swift
//  curiosamente
//
//  Created by Student24 on 09/05/23.
//

import Foundation

struct Locatione : Codable {
    var latitude : Double?
    var longitude : Double?
    var zoomPre : Double?
    var zoomPos : Double?
}

struct PergResposta : Codable {
    var pergunta : String
    var descricao : String
    var respostaCorreta : String
    var respostasErradas : [String]
    var region : Locatione?
}

struct Quize : Codable {
    var _id : String
    var _rev : String
    var categoria : String
    var descricao :String
    var pergResp : [PergResposta]
}

class QuizModel : ObservableObject {
    
    @Published var questions : [Quiz] = []
    
    func fetch(codigo: String) {
        guard let url = URL(string: "\(GLOBAL.prefix)\(codigo)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Quiz].self, from: data)
                
                DispatchQueue.main.async {
                    self?.questions = parsed
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
