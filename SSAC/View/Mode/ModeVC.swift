import UIKit
import SnapKit
import Then


final class ModeVC: UIViewController {
    //MARK: - Properties
    private lazy var autoModeButton = UIButton().then {
        $0.setTitle("자동모드", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var fastModeButton = UIButton().then {
        $0.setTitle("쾌속모드", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var ventilationModeButton = UIButton().then {
        $0.setTitle("환풍/탈취모드", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var sterilizationModeButton = UIButton().then {
        $0.setTitle("살균모드", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private lazy var dryModeButton = UIButton().then {
        $0.setTitle("건조모드", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        $0.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    lazy var buttons = [autoModeButton, fastModeButton, ventilationModeButton, sterilizationModeButton, dryModeButton]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    
    //MARK: - Helpers
    private func configureUI() {
        self.title = "모드 선택하기"
        self.view.backgroundColor = .white
        buttons.forEach { button in
            self.view.addSubview(button)
        }
        
        autoModeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(230)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        fastModeButton.snp.makeConstraints { make in
            make.top.equalTo(autoModeButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        ventilationModeButton.snp.makeConstraints { make in
            make.top.equalTo(fastModeButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        sterilizationModeButton.snp.makeConstraints { make in
            make.top.equalTo(ventilationModeButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        dryModeButton.snp.makeConstraints { make in
            make.top.equalTo(sterilizationModeButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
    }
    
    
    //MARK: - Actions
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.currentTitle {
        case "자동모드":
            print("디버깅: 자동모트 선택됨")
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "자동모드 실행", message: "자동모드가 실행되었습니다.", preferredStyle: .alert)
                let confirm = UIAlertAction(title: "확인", style: .default)
                alert.addAction(confirm)
                self.present(alert, animated: true)
            }
        case "쾌속모드":
            print("디버깅: 쾌속모트 선택됨")
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "쾌속모드 실행", message: "쾌속모드가 실행되었습니다.", preferredStyle: .alert)
                let confirm = UIAlertAction(title: "확인", style: .default)
                alert.addAction(confirm)
                self.present(alert, animated: true)
            }
            
        case "환풍/탈취모드":
            print("디버깅: 환풍/탈취모드 선택됨")
            let vent = VentilationVC()
            self.navigationController?.pushViewController(vent, animated: true)
            
        case "살균모드":
            print("디버깅: 살균모드 선택됨")
            let ster = SeterilizationVC()
            self.navigationController?.pushViewController(ster, animated: true)
            
        case "건조모드":
            print("디버깅: 건조모드 선택됨")
            let dry = DryVC()
            self.navigationController?.pushViewController(dry, animated: true)
            
        default:
            break
        }
    }
    
    
    
}

