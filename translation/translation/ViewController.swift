//
//  ViewController.swift
//  translation
//
//  Created by 정익상 on 2/27/24.
//한국어 코드
//import UIKit
//
//class ViewController: UIViewController, UITextFieldDelegate {
//    var textField: UITextField!
//    var resultLabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        setupConstraints()
//        textField.delegate = self // UITextFieldDelegate 채택
//    }
//    
//    func setupUI() {
//        view.backgroundColor = .white
//        
//        textField = UITextField()
//        textField.borderStyle = .roundedRect
//        textField.placeholder = "한국어를 입력하세요"
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        view.addSubview(textField)
//        
//        resultLabel = UILabel()
//        resultLabel.numberOfLines = 0
//        resultLabel.text = "번역 결과가 여기에 표시됩니다."
//        resultLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(resultLabel)
//    }
//    
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            
//            resultLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
//            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
//    }
//    
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        guard let text = textField.text, !text.isEmpty else {
//            resultLabel.text = "번역 결과가 여기에 표시됩니다."
//            return
//        }
//        translateText(text)
//    }
//    
//    func translateText(_ text: String) {
//        let urlString = "https://libretranslate.de/translate"
//        guard let url = URL(string: urlString),
//              let payload = try? JSONEncoder().encode(["q": text, "source": "ko", "target": "en", "format": "text"]) else {
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = payload
//        
//        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
//            guard let data = data, error == nil,
//                  let translationResult = try? JSONDecoder().decode(TranslationResult.self, from: data) else {
//                DispatchQueue.main.async {
//                    self?.resultLabel.text = "번역에 실패했습니다."
//                }
//                return
//            }
//            DispatchQueue.main.async {
//                self?.resultLabel.text = translationResult.translatedText
//            }
//        }
//        task.resume()
//    }
//}
//
//struct TranslationResult: Codable {
//    let translatedText: String
//}

//import UIKit
//
//class ViewController: UIViewController {
//    var textField: UITextField!
//    var resultLabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        setupConstraints()
//    }
//    
//    func setupUI() {
//        view.backgroundColor = .white
//        
//        textField = UITextField()
//        textField.borderStyle = .roundedRect
//        textField.placeholder = "Enter English text here"
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        view.addSubview(textField)
//        
//        resultLabel = UILabel()
//        resultLabel.numberOfLines = 0
//        resultLabel.text = "Translation will appear here..."
//        resultLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(resultLabel)
//    }
//    
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            
//            resultLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
//            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
//    }
//    
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        guard let text = textField.text, !text.isEmpty else {
//            resultLabel.text = "Translation will appear here..."
//            return
//        }
//        translateText(text)
//    }
//    
//    func translateText(_ text: String) {
//        let urlString = "https://libretranslate.de/translate"
//        guard let url = URL(string: urlString),
//              let payload = try? JSONEncoder().encode(["q": text, "source": "en", "target": "ko", "format": "text"]) else {
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = payload
//        
//        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
//            guard let data = data, error == nil,
//                  let translationResult = try? JSONDecoder().decode(TranslationResult.self, from: data) else {
//                DispatchQueue.main.async {
//                    self?.resultLabel.text = "Failed to translate."
//                }
//                return
//            }
//            DispatchQueue.main.async {
//                self?.resultLabel.text = translationResult.translatedText
//            }
//        }
//        task.resume()
//    }
//}
//
//struct TranslationResult: Codable {
//    let translatedText: String
//}
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    if let error = error {
//        print("Error: \(error.localizedDescription)")
//        return
//    }
//    
//    if let httpResponse = response as? HTTPURLResponse {
//        print("HTTP Response Code: \(httpResponse.statusCode)")
//    }
//
//    guard let data = data, let translationResult = try? JSONDecoder().decode(TranslationResult.self, from: data) else {
//        DispatchQueue.main.async {
//            self?.resultLabel.text = "Failed to translate."
//        }
//        return
//    }
//    DispatchQueue.main.async {
//        self?.resultLabel.text = translationResult.translatedText
//    }
//}
//task.resume()
import UIKit

class ViewController: UIViewController {
    var textField: UITextField!
    var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        translateText("Hello, world!") // 예시 텍스트 번역 시도
    }
    
    func setupUI() {
        // UI 컴포넌트 초기화 및 레이아웃 설정
        view.backgroundColor = .white
        
        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        resultLabel = UILabel()
        resultLabel.numberOfLines = 0
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
    }
    
    func setupConstraints() {
        // Auto Layout 제약조건 설정
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        resultLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func translateText(_ text: String) {
        let urlString = "https://libretranslate.de/translate"
        guard let url = URL(string: urlString),
              let payload = try? JSONEncoder().encode(["q": text, "source": "en", "target": "ko", "format": "text"]) else {
            print("URL 또는 페이로드 생성 실패")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = payload
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("API 호출 중 에러 발생: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("HTTP 응답을 받지 못함")
                return
            }
            print("HTTP 상태 코드: \(httpResponse.statusCode)")
            
            guard let data = data, let translationResult = try? JSONDecoder().decode(TranslationResult.self, from: data) else {
                print("응답 데이터 디코딩 실패")
                return
            }
            
            DispatchQueue.main.async {
                self.resultLabel.text = translationResult.translatedText
                print("번역 결과: \(translationResult.translatedText)")
            }
        }
        task.resume()
    }
}

struct TranslationResult: Codable {
    let translatedText: String
}
