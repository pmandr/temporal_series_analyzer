main <- function(csv_file_location, header = FALSE){
  
  #read data (2 cols are expected as a temporal series f(t,E) )
  my_data <- read.csv(csv_file_location, header) 
  
  #set column names
  colnames(my_data) <- c("t","E") 
  
  #coerce data frame into numerical matrix
  my_data <- data.matrix(my_data) 
  
  my_data[1:10,] #displays 10 first rows textually (data sample)
  
  #plot as a line graph
  plot(my_data[,1], my_data[,2], main="f(t,E)", xlab="t", ylab="E", type = "l")
  
} 

