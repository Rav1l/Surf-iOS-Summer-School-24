import UIKit

/*
 Домашнее задание 1
 • Создать строковую переменную1
 • Создать опциональную строковую переменную2
 • Создать целочисленную константу1
 • Создать целочисленную опциональную константу?
 • Объявить епит со значениями Int
 • Задание с подвохом:
    а. Сложить между собой переменную1 и переменную2
    b. Найти наибольшее из константы1 и константы2
 */

var variable1 = "Hi"
var variable2: String? = "Surf"
let constant1 = 10
let conatsnt2: Int? = 20

enum Numbers: Int {
    case one = 1, two, three, four, five, six, seven
}

if let variable = variable2 {
    print(variable1 + ", " + variable + "!")
} else {
    print(variable1 + "!")
}

if let constant = conatsnt2 {
    constant1 > constant ? print("constant1 больше constant2") : print("constant2 больше constant1")
} else {
    print("constant1 больше constant2")
}

/*
 Домашнее задание 2
 • Создать протокол с строкой
 • Объявить структуру с строкой и числом, подписать под протокол
 • Объявить класс, который содержит:
    а. опциональную переменную с типом протокола
    b. enum из предыдущего пункта
 • Классу добавить инициализатор
 • Создать экземпляр класса
 */

protocol SomeProtocol {
    var string: String { get }
}

struct SomeStruct: SomeProtocol {
    var string: String
    let numbre: Int
    let anotherString: String
}

class SomeClass {
    var optinal: SomeProtocol?
    
    enum Enumiration {
        case some(SomeProtocol?)
    }
    
    init(optinal: SomeProtocol? = nil) {
        self.optinal = optinal
    }
}

let example = SomeClass(optinal: SomeStruct(string: "Hello", numbre: 1, anotherString: "!"))
let example1 = SomeClass()

/*
Домашнее задание 3
 Создать словарь1: ключ - число, значение — число строкой
 Создать массив1 целых чисел (хотя бы одно общее число с словарем)
 Создать массив2, который будет содержать общие числа из массива1 и словаря1 в строковом представлении (значения из словаря1)
 С помощью функций высшего порядка создать новый массив3 из массива2, который будет содержать только не опциональные строки длиннее 4х символов
*/

let dictinary: [Int: String] = [1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven"]
let array1 = [1, 5, 6, -19, 4, 7, 3]
var array2 = [String]()

for (keys, value) in dictinary {
    for arrValue in array1 {
        if keys == arrValue {
            array2.append(value)
        }
    }
}
array2

let array3 = array2
    .compactMap { $0 }
    .filter { $0.count > 4 }
