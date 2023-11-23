import UIKit
import Then
import SnapKit


class ModeCell: UITableViewCell {
    static let identifier = "ModeCell"
   
    private lazy var modeTitleLabel = UILabel().then {
        $0.text = "test"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    private lazy var modeSubTitleLabel = UITextView().then {
        $0.text = "subtitle test"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.contentMode = .topLeft
        $0.isUserInteractionEnabled = false
    }
    
    private lazy var modeImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    
    
    var index: Int? {
        didSet {
            guard let index = self.index else { return }
            switch index {
            case 0:
                self.modeTitleLabel.text = "모드"
                self.modeSubTitleLabel.text = "일반/쾌속/환풍/탈취 등 다양한 모드를 통해 신발을 관리해보세요"
                self.modeImage.image = UIImage(named: "mode.png")
            case 1:
                self.modeTitleLabel.text = "신발수납/추출"
                self.modeSubTitleLabel.text = "신발을 자동으로 수납하거나 꺼내보세요. 완벽하게 관리된 신발을 신고 좋은 하루 보내시길."
                self.modeImage.image = UIImage(named: "shoes.png")
            case 2:
                self.modeTitleLabel.text = "내부 온습도 확인하기"
                self.modeSubTitleLabel.text = "신발장 내부의 온도와 습도가 어느정도인지 확인해보세요! 온습도는 신발의 수명과 직결된 문제입니다."
                self.modeImage.image = UIImage(named: "temp.png")
            case 3:
                self.modeTitleLabel.text = "신발 편집하기"
                self.modeSubTitleLabel.text = "수납한 신발의 이름을 정해주세요."
                self.modeImage.image = UIImage(named: "name.png")
            default:
                break
            }
        }
    }
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //MARK: - Helpers
    private func configureUI() {
        [modeTitleLabel, modeSubTitleLabel, modeImage].forEach {
            self.contentView.addSubview($0)
        }
        
        modeTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        modeSubTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(modeTitleLabel.snp.bottom)
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        modeImage.snp.makeConstraints { make in
            make.top.equalTo(modeTitleLabel)
            make.trailing.equalToSuperview().inset(10)
            make.width.height.equalTo(130)
        }
        
    }
}
