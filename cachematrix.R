## Below are two functions that are used to create a special object that 
## stores a numeric matrix and cache's its inverse


## The following function creates a special "matrix" which is a list 
## containing a function to (1) set the value of the matrix, (2) get the value 
## of the matrix, (3) set the value of the inverse, (4) get the value of the
## inverse

makeCacheMatrix <- function(x = matrix()) {
	s <- NULL
	set <- function(y) {
		x <<- y
		s <<- NULL
	}

	get <- function() x

	set_sol <- function(sol) s <<- solve

	get_sol <- function() s

	list(set = set, get = get, set_sol=set_sol, get_sol=get_sol)
}


## The following function calculates the inverse of the special "vector" 
## created with the above function. It first checks to see if the inverse has 
## already been calculated. If so it gets the mean from the cache and skips 
## the computation. Otherwise, it calculates the inverse of the data and sets 
## the value of the inverse in the cache via the set_sol function.

cacheSol <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	s <- x$get_sol()

	if(!is.null(s)){
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	s <- solve(data, ...)
	x$set_sol(sol)
	s
}
