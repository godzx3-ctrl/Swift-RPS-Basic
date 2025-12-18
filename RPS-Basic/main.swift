//
//  main.swift
//  RPS-Basic
//
//  Created by 한주헌 on 12/18/25.
//

import Foundation

let choices = ["가위","바위","보"]
var userValue:String?

// 게임종료 체크함수
func gamePlay(console:String?)->Bool
{
    if let gameConsole = console
    {
        if gameConsole == "그만"
        {
            return false
        }
    }
    return true
}

// 사용자가 입력한 값이 가위바위보 안의 값인지 확인하는 함수
func checkRPS(userValue:String?)->Bool
{
    for rps in choices
    {
        if let Value = userValue, Value == rps
        {
            return true
        }
    }
    return false
}

// 컴퓨터 랜덤값 추출 함수
func computerChoice()->String
{
    return choices.randomElement()!
}

// 값 비교 함수
func determineWinner(user:String, computer:String)
{
    if(user == computer)
    {
        print("비겼습니다. 사용자:\(user) | 컴퓨터:\(computer)")
    }else if (user == "가위" && computer == "보") ||
                (user == "바위" && computer == "가위") ||
                (user == "보" && computer == "바위")
    {
        print("축하합니다, 이겼습니다! 사용자:\(user) | 컴퓨터:\(computer)")
    }else
    {
        print("아쉽게도 졌습니다... 사용자:\(user) | 컴퓨터:\(computer)")
    }
}

print("컴퓨터와의 대결 - 가위바위보 게임!")
sleep(1)

while true
{
    userValue = nil
    print("[가위,바위,보] 중 한가지를 입력해주세요(종료를 원하시면 [그만]을 입력해주세요.)")
    userValue = readLine()
    
    guard gamePlay(console: userValue) else
    {
        break
    }
    
    guard checkRPS(userValue: userValue) else
    {
        print("잘못된 값을 입력하였습니다. [가위,바위,보] 중 하나의 값을 입력해주세요.")
        continue
    }
        determineWinner(user: userValue!, computer: computerChoice())
    
}
print(" ")
print("게임이 종료되었습니다. 플레이 해주셔서 감사합니다.")
print("by Han")
