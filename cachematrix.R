## make the cache which is really a list containing a function to

## set the value of the vector
## get the value of the vector
## set the value of the mean
## get the value of the mean


makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


##inverse of a square matrix can be done with the "solve" function.  e.g. if x is a square invertable. solve(x) will return the inverse.
## Return the inverse

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv

}

