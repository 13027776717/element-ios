// File created from SimpleUserProfileExample
// $ createScreen.sh Room/PollTimeline PollTimeline
// 
// Copyright 2021 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import SwiftUI

enum PollTimelineStateAction {
    case viewAction(PollTimelineViewAction)
}

enum PollTimelineViewAction {
    case selectAnswerOption(PollTimelineAnswerOption)
}

struct PollTimelineAnswerOption: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let count: UInt
    let winner: Bool
    let selected: Bool
}

struct TimelinePoll {
    let question: String
    var answerOptions: [PollTimelineAnswerOption]
    var closed: Bool
    var totalAnswerCount: UInt
}

struct PollTimelineViewState: BindableState {
    let poll: TimelinePoll
}
