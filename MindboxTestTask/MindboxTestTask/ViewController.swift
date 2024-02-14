//
//  ViewController.swift
//  MindboxTestTask
//
//  Created by Михаил Чертов on 14.02.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    enum ErrorEnum: String, Error {
        case typeConversionError = "Ошибка преобразования типа"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        areaCircle(r: 5)
        areaTriangle(a: 7, b: 24, c: 25)
    }
    
    private func numberFormatter<T: Numeric>(number: T) -> String {
        return String(format: "%.2f", number as! CVarArg)
    }
    
    func areaCircle<T: BinaryFloatingPoint>(r: T) {
        guard let r = r as? Double else {
            fatalError(ErrorEnum.typeConversionError.rawValue)
        }
        let result = Double.pi * r * r
        print("Площадь круга с радиусом \(r) равна \(numberFormatter(number: result))")
    }
    
    
    private func isTriangleIsRectangular<T: BinaryFloatingPoint>(a: T, b: T, c: T) {
        let triangle = [a,b,c].sorted()
        if triangle[0] * triangle[0] + triangle[1] * triangle[1] == triangle[2] * triangle[2] {
            print("Треугольник является прямоугольным")
        }  else {
            print("Треугольник не является прямоугольным")
        }
    }
    
    func areaTriangle<T: BinaryFloatingPoint>(a: T, b: T, c: T) {
        guard let a = a as? Double, let b = b as? Double, let c = c as? Double else {
            fatalError("Ошибка преобразования типа")
        }
        
        isTriangleIsRectangular(a: a, b: b, c: c)
        
        let s = (a + b + c) / 2
        let result = sqrt(s * (s - a) * (s - b) * (s - c))
        print("Площадь треугольника со сторонами \(a), \(b), \(c) равна \(numberFormatter(number: result))")
    }

}

