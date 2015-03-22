
The first function, makeVector creates a special "vector", which is really a list containing a function to
	1.	set the value of the vector
	2.	get the value of the vector
	3.	set the value of the mean
	4.	get the value of the mean

## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse matrix than compute it repeatedly. The next function are used to cache the inverse of a matrix

## The first function, makeVector creates a special "vector", which is really a list containing a function to
##1. set the calue of the matrix
##2. get the value of the matrix
##3. set the value of inverse of the matrix
##4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
      x <<- y
        inv <<- NULL
    }
     get <- function() x
     setinverse <- function(solve) inv <<- solve
     getinverse <- function() inv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  }


## The following function returns the inverse of the matrix. When check in first time the inverse is computed. If so, it gets the result and skip ths computation. If not, it compute the inverse, sets the value in the cache via setinverse function.


## the function assumes that the matrix is invertible.

cacheSolve <- function(x, ...) {
     inv <- x$getinverse()
     if(!is.null(inv)) {
         message("getting cached data")
         return(inv)
     }
     matrix <- x$get()
     m <- solve(matrix)
     x$setinverse(m)
     m
}
