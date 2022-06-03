//
//  PostModel.swift
//  Navigation
//
//  Created by Mac on 02.06.2022.
//

import Foundation
import UIKit

struct Lenta {
    let author: String
    let description: String?
    let image: UIImage
    var likes: Int
    var views: Int
    static func News() -> [Lenta] {
        var news = [Lenta]()
        news.append(Lenta(author: "Отменяются все катаклизмы!", description: "Все больные успешно излечатся, вымерли вредные микроорганизмы!", image: UIImage(named: "image-2")!, likes: 17, views: 117))
        news.append(Lenta(author: "Первый контакт!", description: "Пришельцы нагрянули не с целью экспансии, а чтобы забрать ядерные отходы!", image: UIImage(named: "prishelci")!, likes: 17, views: 117))
        news.append(Lenta(author: "Взлет рубля!", description: "Пачка евро за монету пять рублей, сто баксов в обмен на пятнадцать копеек!", image:UIImage(named: "dengi")!, likes: 17, views: 117))
        return news
    }
}
