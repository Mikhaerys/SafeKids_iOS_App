//
//  ContentView.swift
//  SafeKids_IOS_APP
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

enum Screen: String, CaseIterable {
    case login
    case description
    case teacher
    case guardian
    case teacherProfile
    case guardianProfile
    case teacherActivity
    case guardianActivity
    case money
}

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            LoginScreen(
                onTeacherClick: { navigationPath.append(Screen.teacher) },
                onGuardianClick: { navigationPath.append(Screen.guardian) },
                onDescriptionClick: { navigationPath.append(Screen.description) }
            )
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .login:
                    LoginScreen(
                        onTeacherClick: { navigationPath.append(Screen.teacher) },
                        onGuardianClick: { navigationPath.append(Screen.guardian) },
                        onDescriptionClick: { navigationPath.append(Screen.description) }
                    )
                case .description:
                    DescriptionScreen()
                case .teacher:
                    TeacherScreen(
                        onProfileClick: { navigationPath.append(Screen.teacherProfile) },
                        onHomeClick: { navigationPath.append(Screen.teacher) },
                        onActivityClick: { navigationPath.append(Screen.teacherActivity) }
                    )
                case .guardian:
                    GuardianScreen(
                        onProfileClick: { navigationPath.append(Screen.guardianProfile) },
                        onHomeClick: { navigationPath.append(Screen.guardian) },
                        onActivityClick: { navigationPath.append(Screen.guardianActivity) },
                        onMoneyClick: { navigationPath.append(Screen.money) }
                    )
                case .teacherProfile:
                    TeacherProfileScreen(
                        onHomeClick: { navigationPath.append(Screen.teacher) },
                        onProfileClick: { navigationPath.append(Screen.teacherProfile) }
                    )
                case .guardianProfile:
                    GuardianProfileScreen(
                        onHomeClick: { navigationPath.append(Screen.guardian) },
                        onProfileClick: { navigationPath.append(Screen.guardianProfile) }
                    )
                case .teacherActivity:
                    ActivityScreen(
                        onHomeClick: { navigationPath.append(Screen.teacher) },
                        onProfileClick: { navigationPath.append(Screen.teacherProfile) }
                    )
                case .guardianActivity:
                    ActivityScreen(
                        onHomeClick: { navigationPath.append(Screen.guardian) },
                        onProfileClick: { navigationPath.append(Screen.guardianProfile) }
                    )
                case .money:
                    MoneyScreen(
                        onHomeClick: { navigationPath.append(Screen.guardian) },
                        onProfileClick: { navigationPath.append(Screen.guardianProfile) }
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
