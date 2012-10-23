vec1<-c(1:10)  #generate vector(1...10)
vec1 #display input vector
result1<-sort(vec1,decreasing = TRUE) #sort
result1 #display result vector
###########################################################

###########################################################
# bubbleSort
# @param input input vector
# @return output output vector
###########################################################
bubbleSort<-function(input){
  output<-input
  length<-length(input)
  for (i in 1:length){
    j<-length
    while(j>i){
      if(output[j-1]<output[j]){
        temp<-output[j-1]
        output[j-1]<-output[j]
        output[j]<-temp
      }
      j<-j-1
    }
  }
  return(output)
}

vec2<-c(1:10) #generate vector(1...10)
vec2 #display input vector
result2<-bubbleSort(vec2) #sort
result2 #display output vector
