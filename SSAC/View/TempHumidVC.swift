import UIKit

final class TempHumidVC: UIViewController {
    //MARK: - Properties
    private lazy var tempLabel = UILabel().then {
        $0.text = "test °C"
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    private lazy var humidLabel = UILabel().then {
        $0.text = "test %"
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    //MARK: - Helpers
    private func configureUI() {
        self.view.backgroundColor = .white
        [tempLabel, humidLabel].forEach { view in
            self.view.addSubview(view)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        humidLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tempLabel.snp.bottom).offset(100)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
    }
    
    
    //MARK: - Actions
  

}
