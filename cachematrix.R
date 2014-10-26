## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { ## this function creates a cache matrix
											## and defines 4 functions
		i <- NULL				## initial inverse matrix value set to NULL
		
		set <- function(y){		##	this function will set 'x' to the argument 
			x <<- y				##							value (a matrix)
								## 
			
			i <<- NULL			## inverse matrix 'i' is reset to NULL because 
		}						## 		the inverse of the new matrix 
								## 		hasn't been computed yet
								
		get<- function(){  		## this function will return the matrix 'x'
			x
		}
		setinverse <-function(solve){	## this function replaces the value of 'i' 
			i <<- solve					##  	in the global environment with the  
										##		newly computed inverse matrix 
		}
		getinverse <-function(){		## this function returns the inverse matrix 'i'
			i
		}
		
		list(set = set, get = get, setinverse = setinverse, 
				getinverse = getinverse)	## returns a list of the functions defined
											##  in the parent function makeCacheMatrix
													

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {				 ## Return a matrix that is the inverse of 'x'
       
		i <-x$getinverse()			## loads the newest value of the inverse matrix 
		if(!is.null(i)){			##  if the inverse matrix was already computed
			message("getting cached data") ## then tell user that cached value 
									## 		of the inverse matrix will be used  
			return (i)   			##	return the cached value of the inverse matrix 'i'
		}
		data<-x$get()			## load the matrix data
		i<-solve(data, ...)		## use the solve() function to obtain the inverse matrix
		x$setinverse(i) 		## updates i to new inverse matrix, assigns it as the 
								## 				inverse matrix for 'x'
		i						## return newly computed inverse matrix 'i' 
}
