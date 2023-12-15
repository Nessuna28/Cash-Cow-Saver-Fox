//
//  LoginImages.swift
//  SaverFox
//
//  Created by Angelique Freier on 07.12.23.
//

import Foundation
import SwiftUI

enum LoginImages: String, Identifiable, CaseIterable {
    case ape, dino, elephant, sloth, fox, giraffe, bunny, dog, kangaroo, cat, koala, crocodile, lion, mouse, hippo, panda, parrot, deer, seal, sheep, tortoise, snake, pig, tiger, zebra
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
            
        case .ape: return Strings.ape
        case .dino: return Strings.dino
        case .elephant: return Strings.elephant
        case .sloth: return Strings.sloth
        case .fox: return Strings.fox
        case .giraffe: return Strings.giraffe
        case .bunny: return Strings.bunny
        case .dog: return Strings.dog
        case .kangaroo: return Strings.kangaroo
        case .cat: return Strings.cat
        case .koala: return Strings.koala
        case .crocodile: return Strings.crocodile
        case .lion: return Strings.lion
        case .mouse: return Strings.mouse
        case .hippo: return Strings.hippo
        case .panda: return Strings.panda
        case .parrot: return Strings.parrot
        case .deer: return Strings.deer
        case .seal: return Strings.seal
        case .sheep: return Strings.sheep
        case .tortoise: return Strings.tortoise
        case .snake: return Strings.snake
        case .pig: return Strings.pig
        case .tiger: return Strings.tiger
        case .zebra: return Strings.zebra
        }
    }
    
    var image: Image {
        switch self {
            
        case .ape: return Image("affe")
        case .dino: return Image("dino")
        case .elephant: return Image("elefant")
        case .sloth: return Image("faultier")
        case .fox: return Image("fuchs")
        case .giraffe: return Image("giraffe")
        case .bunny: return Image("hase")
        case .dog: return Image("hund")
        case .kangaroo: return Image("kaenguru")
        case .cat: return Image("katze")
        case .koala: return Image("koala")
        case .crocodile: return Image("kroko")
        case .lion: return Image("loewe")
        case .mouse: return Image("maus")
        case .hippo: return Image("nilpferd")
        case .panda: return Image("panda")
        case .parrot: return Image("papagei")
        case .deer: return Image("reh")
        case .seal: return Image("robbe")
        case .sheep: return Image("schaf")
        case .tortoise: return Image("schildi")
        case .snake: return Image("schlange")
        case .pig: return Image("schwein")
        case .tiger: return Image("tiger")
        case .zebra: return Image("zebra")
        }
    }
}
