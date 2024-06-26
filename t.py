def formatter(value):
    count = 0
    result_list = []
    result_string = ""
    str_value = str(value)
    
    for i in range(len(str_value) , 0 , -1):
        count +=1
        result_list.append(str_value[i - 1])
        if(count == 3 ):
            result_list.append(",")
            count = 0


    for s in range(len(result_list) -1 , -1 , -1):
        result_string += result_list[s]

    return result_string