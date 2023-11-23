//
//  ViewController.swift
//  SSAC
//
//  Created by 김은상 on 11/12/23.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
/*
 필요한 기능
 1. 건조
 2. 수납/추출
 3. 살균
 4. 모드
 */
    
    private lazy var appTitle = UILabel().then {
        $0.text = "SSAC"
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    private lazy var mainTV = UITableView().then {
        $0.register(ModeCell.self, forCellReuseIdentifier: ModeCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = self.view.frame.size.height/5
        $0.largeContentTitle = "SSAC"
        $0.isScrollEnabled = false
    }
    
    private lazy var dryButton = UIButton().then {
        $0.setTitle("건조", for: .normal)
        $0.setTitleColor(.orange, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.orange.cgColor
    }
    
    private lazy var modeButton = UIButton().then {
        $0.setTitle("모드", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private lazy var uvButton = UIButton().then {
        $0.setTitle("살균", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    private lazy var shoesButton = UIButton().then {
        $0.setTitle("신발수납/추출", for: .normal)
        $0.setTitleColor(.green, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.green.cgColor
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.title = "SSAC"
    }
    
    private func configureUI() {
        self.view.addSubview(mainTV)
        mainTV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    //MARK: - Actions
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 4 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ModeCell.identifier, for: indexPath) as! ModeCell
        cell.index = indexPath.row
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let modeVC = ModeVC()
            self.navigationController?.pushViewController(modeVC, animated: true)
        case 1:
            let shoesVC = ShoesVC()
            self.navigationController?.pushViewController(shoesVC, animated: true)
        case 2:
            let tempVC = TempHumidVC()
            self.navigationController?.pushViewController(tempVC, animated: true)
        case 3:
            let editVC = EditVC()
            self.navigationController?.pushViewController(editVC, animated: true)
        default:
            break
        }
    }
}
