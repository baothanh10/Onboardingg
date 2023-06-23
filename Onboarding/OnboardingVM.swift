//
//  OnboardingVM.swift
//  Onboarding
//
//  Created by Thành Mai on 23/06/2023.
//

import Foundation


struct OnboardingModel {
    var logo: String
    var title: String
    var description: String
}

struct OnboardingVM {
    var onboardingData = [OnboardingModel(logo: "ic_onboarding_1",
                                          title: "title_onboarding_title_1",
                                          description: "title_onboarding_desc_1"),
                          OnboardingModel(logo: "ic_onboarding_2",
                                          title: "title_onboarding_title_2",
                                          description: "title_onboarding_desc_2"),
                          OnboardingModel(logo: "ic_onboarding_3",
                                          title: "title_onboarding_title_3",
                                          description: "title_onboarding_desc_3"),]
}
