//: Playground - noun: a place where people can play

import UIKit

for numero in 0...100 {
    if numero % 2 == 0{
        print("#\(numero)\tPar")
    }else{
        print("#\(numero)\tImpar")
    }
    if numero % 5 == 0 {
        print("#\(numero)\tBingo!!!")
    }
    if numero >= 30 &&  numero <= 40 {
        print("#\(numero)\tViva Swift!!!")
    }
}