import Then
import SnapKit
import UIKit


/* 
신발을 꺼내기 위한 화면
1 2 3
4 5 6
번호의 버튼이 존재하고, 버튼을 누르면 저장 or 수납

 */

final class ShoesVC: UIViewController {
    //MARK: - Properties
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "신발 수납/추출"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    private lazy var firstShoesButton = UIButton().then {
        $0.setTitle("1번 신발", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var secondShoesButton = UIButton().then {
        $0.setTitle("2번 신발", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var thirdShoesButton = UIButton().then {
        $0.setTitle("3번 신발", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var fourthShoesButton = UIButton().then {
        $0.setTitle("4번 신발", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var fifthShoesButton = UIButton().then {
        $0.setTitle("5번 신발", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var sixthShoesButton = UIButton().then {
        $0.setTitle("6번 신발", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var shoesInView = UIView().then {
        $0.backgroundColor = .systemRed
    }
    
    private lazy var shoesOutView = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    
    private lazy var shoesInLabel = UILabel().then {
        $0.text = ": 수납중"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    
    private lazy var shoesOutLabel = UILabel().then {
        $0.text = ": 빈수납장"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    //MARK: - Helpers
    private func configureUI() {
        
        self.view.backgroundColor = .white
        
        [titleLabel, firstShoesButton, secondShoesButton, thirdShoesButton, fourthShoesButton, fifthShoesButton, sixthShoesButton, shoesInView, shoesInLabel, shoesOutView, shoesOutLabel].forEach {
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        
        firstShoesButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(30)
            make.height.width.equalTo(100)
        }
        
        secondShoesButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        thirdShoesButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.trailing.equalToSuperview().inset(30)
            make.height.width.equalTo(100)
        }
        
        fourthShoesButton.snp.makeConstraints { make in
            make.top.equalTo(firstShoesButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.height.width.equalTo(100)
        }
        
        fifthShoesButton.snp.makeConstraints { make in
            make.top.equalTo(thirdShoesButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        sixthShoesButton.snp.makeConstraints { make in
            make.top.equalTo(thirdShoesButton.snp.bottom).offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.width.equalTo(100)
        }
        
        shoesInView.snp.makeConstraints { make in
            make.top.equalTo(sixthShoesButton.snp.bottom).offset(30)
            make.leading.equalTo(firstShoesButton.snp.leading)
            make.height.equalTo(1)
            make.width.equalTo(30)
        }
        
        shoesOutView.snp.makeConstraints { make in
            make.top.equalTo(shoesInView.snp.bottom).offset(30)
            make.leading.equalTo(firstShoesButton.snp.leading)
            make.height.equalTo(1)
            make.width.equalTo(30)
        }
        
        shoesInLabel.snp.makeConstraints { make in
            make.centerY.equalTo(shoesInView.snp.centerY)
            make.leading.equalTo(shoesInView.snp.trailing).offset(5)
            
        }
        
        shoesOutLabel.snp.makeConstraints { make in
            make.centerY.equalTo(shoesOutView.snp.centerY)
            make.leading.equalTo(shoesOutView.snp.trailing).offset(5)
            
        }
        
    }
    
    
    
    
    //MARK: - Actions
    @objc func buttonTapped(_ sender: UIButton) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "수납 / 추출", message: "수납과 추출 중 고르세요", preferredStyle: .alert)
            let shoesIn = UIAlertAction(title: "수납", style: .destructive) { _ in
                sender.backgroundColor = .systemRed
            }
            let shoesOut = UIAlertAction(title: "추출", style: .default) { _ in
                sender.backgroundColor = .systemBlue
            }
            alert.addAction(shoesIn)
            alert.addAction(shoesOut)
            self.present(alert, animated: true)
        }
        
        
    }
    

}
