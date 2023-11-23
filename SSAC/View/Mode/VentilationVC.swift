import UIKit



class VentilationVC: UIViewController {
    //MARK: - Properties
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "환기"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
    }
    
    private lazy var ventilationTimeLabel = UILabel().then {
        $0.text = "환기시킬 시간을 설정해주세요( 최대 30분 )"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textAlignment = .center
    }
    
    private lazy var timeStepper = UIStepper().then {
        $0.minimumValue = 0.0
        $0.maximumValue = 30.0
        $0.stepValue = 1.0
        $0.autorepeat = true
        $0.addTarget(self, action: #selector(stepperDidChanged(_:)), for: .valueChanged)
    }
    
    private lazy var confirmButton = UIButton().then {
        $0.setTitle("환기시작", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(confirmButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        
        
    }
    
    //MARK: - Helpers
    private func configureUI() {
        self.view.backgroundColor = .white
        [titleLabel, ventilationTimeLabel, timeStepper, confirmButton].forEach {
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(30)
        }

        ventilationTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        
        timeStepper.snp.makeConstraints { make in
            make.top.equalTo(ventilationTimeLabel.snp.bottom).offset(20)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(timeStepper.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
    }
    
    
    //MARK: - Actions
    @objc func stepperDidChanged(_ sender: UIStepper) {
        print("디버깅 : 스테퍼의 값은 \(sender.value)")
        self.ventilationTimeLabel.text = String(Int(sender.value)) + "분"
    }
    
    @objc func confirmButtonTapped(_ sender: UIButton) {
        print("디버깅: 확인버튼 눌림")
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "환풍기 실행", message: "\(Int(self.timeStepper.value))분 동안 환풍기 실행 후 자동 종료됩니다.", preferredStyle: .alert)
            let confirm = UIAlertAction(title: "확인", style: .default) { success in
                self.timeStepper.value = 0
                self.ventilationTimeLabel.text = "환기시킬 시간을 설정해주세요( 최대 30분 )"

                
            }
            alert.addAction(confirm)
            self.present(alert, animated: true)
        }
    }
}
