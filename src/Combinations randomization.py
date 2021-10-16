import random

items_array = [0,0,0,1,1,1,2,2,2,3,3,3,4,4,4,5,5,5]
check_array = []
chosen_set_length = 3
combinations_cap = (len(items_array)/chosen_set_length)**chosen_set_length

count = 0


helmet_array = ['Bronzeh','Ironh','Steelh','Miltrilh','Adamanth','Runeh']
body_array = ['Bronzeb','Ironb','Steelb','Miltrilb','Adamantb','Runeb']
legs_array = ['Bronzel','Ironl','Steell','Miltrill','Adamantl','Runel']

while count  < combinations_cap :
    random.shuffle(items_array)
    rand_3 = items_array[0:chosen_set_length] 
    if rand_3 in check_array:
        #print(rand_3)
        #print('is already already inside')
        pass
        
    else:
        check_array.append(rand_3)
        count += 1
        #print(rand_3)

#print(check_array)
print('Total different combinations= ' + str(len(check_array)))

outfit_array = []
for set in check_array:
    #print(set)
    current_outfit_array = []
    current_outfit_array.append(helmet_array[set[0]])
    current_outfit_array.append(body_array[set[1]])
    current_outfit_array.append(legs_array[set[2]])
    outfit_array.append(current_outfit_array)


for outfit in outfit_array:
    print(outfit)
    
