//
//  OnboardingVC.swift
//  Onboarding
//
//  Created by Thành Mai on 22/06/2023.
//

import UIKit

class OnboardingVC: UIViewController {


    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var currentIndexLabel: UILabel!
    private let pageControl = ExtendedpageControll(numberOfPages: 3, currentPage: 0, isCircular: false)
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControlContainerView: UIView!
    
    private let viewModel = OnboardingVM()


    override func viewDidLoad() {
        super.viewDidLoad()
        pageControlContainerView.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: pageControlContainerView.centerXAnchor, constant: 0).isActive = true

        pageControl.centerYAnchor.constraint(equalTo: pageControlContainerView.centerYAnchor, constant: 0).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 61).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 6).isActive = true
        OnboardingCollectionViewCell.registerWithCollectionView(collectionView)
        pageControl.didSetPage = { [weak self] page in
            print(page)
            guard let self = self else { return }
            self.currentIndexLabel.text = "\(page + 1) / 3"
            self.skipButton.isHidden = page == 2
            self.startButton.isHidden = page < 2
        }
        
        setupViews()


        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func setupViews() {
        startButton.isHidden = true
        startButton.borderRadius()
       // startButton.setTitle("btn_onboarding_start".localition(), for: .normal)
       //skipButton.setTitle("btn_onboarding_skip".localition(), for: .normal)
    }
}


extension OnboardingVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.onboardingData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = viewModel.onboardingData[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reuseIdentifier, for: indexPath) as? OnboardingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configCell(data: data)
        return cell
    }
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("WIDTH: ", UIScreen.main.bounds.size.width )
//        print("colleciton view index: ", collectionView.index)
        let index = round(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        print(index)
        if index <= 0 {
            pageControl.currentpage = 0
        } else if index >= 2 {
            pageControl.currentpage = 2
        } else {
            pageControl.currentpage = Int(index)
        }
    }
}




