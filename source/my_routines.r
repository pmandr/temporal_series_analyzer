main <- function(csv_file_location = "../data/Sheet1.csv", header = FALSE){
  
  #read data (2 cols are expected as a temporal series f(t,E) )
  my_data <- read.csv(csv_file_location, header) 
  
  #removes last element to add
  
  #this appears to be interesting data: The difference between one measure and the previous one
  #my_data[2:length(my_data)] starts at index 2 in order to have the same length as the next argument
  #cbind(my_data, diff(as.matrix(my_data))[,2])
  
  
  #coerce data frame into numerical matrix
  my_data_matrix <- data.matrix(my_data) 
  
  #this appears to be interesting data: The difference between one measure and the previous one
  my_data_difference <- diff(my_data_matrix)[,2]
  #my_data_difference <- rbind(c(my_data_difference[1]), my_data_difference)
  
  #Scatter Plot Smoothing: This function performs the computations for the LOWESS smoother which uses locally-weighted polynomial regression
  my_data_lowess <- lowess(my_data)
  
  #my_data
  #my_data_difference
  #my_data_lowess
  #my_data <- cbind(my_data, my_data_difference)
  #my_data <- cbind(my_data, my_data_lowess)
  
  #set column names
  colnames(my_data) <- c("t","E") 
  
  
  #my_data[1:10,] #displays 10 first rows textually (data sample)
  dim(my_data)
  
  #plot as a line graph
  par(mfrow=c(3,2))         # multifigure (6 charts) setup: 3 rows, 2 cols
  plot(my_data[,1], my_data[,2], main="my_data", xlab="t", ylab="E", type = "l")
  plot(my_data_matrix[,1], my_data_matrix[,2], main="my_data_matrix", xlab="t", ylab="E", type = "l")
  plot(my_data_difference, main="my_data_difference", xlab="t", ylab="E", type = "l")
  plot(my_data_lowess, main="my_data_lowess", xlab="t", ylab="E", type = "l")
  plot(my_data_difference[my_data_difference<0], main = "diff < 0", type = "l") #, ylim = c(min(my_data[,2]),max(my_data[,2])) )
  plot(my_data_difference[my_data_difference>0], main = "diff > 0", type = "l") #, ylim = c(min(my_data[,2]),max(my_data[,2])))
  
  cor(my_data_matrix, my_data)
  
  #return(my_data) 
  
  summary(my_data)
} 


