import random

def monty_hall_sim(trials=10000):
    stay_wins = 0
    switch_wins = 0

    for _ in range(trials):
        # 1. 初始化门：0代表羊，1代表车
        doors = [0, 0, 0]
        car_position = random.randint(0, 2)
        doors[car_position] = 1
        
        # 2. 玩家最初的选择
        player_choice = random.randint(0, 2)
        
        # 3. 主持人打开一扇有山羊的门
        # 主持人不能开玩家选的门，也不能开有车的门
        possible_host_doors = [
            i for i in range(3) 
            if i != player_choice and doors[i] == 0
        ]
        host_opens = random.choice(possible_host_doors)
        
        # 4. 如果“坚持不换”赢了
        if doors[player_choice] == 1:
            stay_wins += 1
            
        # 5. 如果“换门”赢了
        # 换门后的选择是：既不是原选，也不是主持人开的那扇
        remaining_door = [
            i for i in range(3) 
            if i != player_choice and i != host_opens
        ][0]
        
        if doors[remaining_door] == 1:
            switch_wins += 1

    print(f"总实验次数: {trials}")
    print(f"坚持不换中奖次数: {stay_wins} (概率: {stay_wins/trials:.2%})")
    print(f"换门后中奖次数: {switch_wins} (概率: {switch_wins/trials:.2%})")

if __name__ == "__main__":
    monty_hall_sim()