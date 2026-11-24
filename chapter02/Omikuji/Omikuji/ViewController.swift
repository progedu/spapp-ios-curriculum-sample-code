//
//  ViewController.swift
//  Omikuji
//
//  Created by admin on 2026/09/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        // ランダムな数値を取得
        let score = generateRandomNumber(max: 100)
        
        // おみくじ箱の画像を表示
        img.image = #imageLiteral(resourceName: "omikuji")
        
        // ボタンをタップできないようにする
        btn.isEnabled = false
        
        // アニメーション
        UIView.animate(withDuration: 1.0, animations: {
            // 画像を180度回転
            self.img.transform = CGAffineTransform(rotationAngle: .pi)
            
        }) { _ in
            // アニメーション終了
            // 回転が終わったら元の向きに戻す
            self.img.transform = .identity
            
            // 結果を表示
            self.img.image = self.getResultImage(score: score)
            
            // ボタンのテキストを変更
            self.btn.setTitle("もう一度", for: .normal)
            
            // ボタンをタップできるようにする
            self.btn.isEnabled = true
        }
    }
    
    func generateRandomNumber(min: Int = 0, max: Int) -> Int {
        return Int.random(in: min...max)
    }
    
    func getResultImage(score: Int) -> UIImage {
        return switch score {
        case 91...100: #imageLiteral(resourceName: "daikichi")
        case 71...90: #imageLiteral(resourceName: "chukichi")
        case 51...70: #imageLiteral(resourceName: "shoukichi")
        case 31...50: #imageLiteral(resourceName: "kichi")
        case 11...30: #imageLiteral(resourceName: "kyou")
        default: #imageLiteral(resourceName: "daikyo")
        }
    }
}
