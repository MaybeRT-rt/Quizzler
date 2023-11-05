//
//  QuizzlerView.swift
//  Quizzler
//
//  Created by Liz-Mary on 05.11.2023.
//

import UIKit

class QuizzlerView: UIView {
    private lazy var question: UILabel = {
        let element = UILabel()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
}
