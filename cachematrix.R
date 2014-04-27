

## These two functions cache inverse matrix

## first function creates "matrix" object that caches its inverse

makeCacheMatrix <- function(x = matrix()) {
        InverseMatrix <- NULL
        get <- function() {
            x
        }
        getInverse <-function() {
            InverseMatrix
        }
        setInverse <- function(Inverse) {
            InverseMatrix <<- Inverse
        }
        list (get = get, getInverse = getInverse, setInverse = setInverse)
}


## This function makes inverse of "matrix" object

cacheSolve <- function(y, ...) {
    
    InverseMatrix <- y$getInverse()
    if(!is.null(InverseMatrix)) {
        message("getting cached data")
        return(InverseMatrix)
    }
    data <- y$get()
    InverseMatrix <- solve(data, ...)
    y$setInverse(InverseMatrix)
    InverseMatrix
}



