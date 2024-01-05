//
//  TipViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 05.01.24.
//

import Foundation

class TipViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var currentTip = ""
    
    let tips = [
    "Gib nicht alles auf einmal aus!",
    "Überlege vorher, ob du das was du kaufen möchtest wirklich brauchst.",
    "Wenn du viel spart kannst du dir später etwas Großes kaufen.",
    "Rechne beim Einkaufen im Kopf immer mit, so kannst du sicher sein, dass dein Geld auch reicht.",
    "Denk an besondere Anlässe wie Geburtstage und leg dir Geld dafür zur Seite."
    ]
    
    
    // MARK: - Functions
    
    func setCurrentTip() {
        
        currentTip = tips.randomElement() ?? "kein Tipp verfügbar"
    }
}
