## These two functioins combined will find the inverse of any
## matrix and then store it if you want to retreve it latter.
## These functions only work on invertable matrices

## This function generates 4 functions  
## -set() to set the matrix
## -get() to retrieve the matrix
## -setinv() to store the inverse
## -getinv() to retrieve the inverse
# this function takes a matrix as an argument

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinv <- function(inv) m <<- inv
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## This function takes the results from the first function as 
## an input.  if the inverse is stored, it will return it,
## otherwise it will solve the inverse

cacheSolve <- function(x) {
    ## Return a matrix that is the inverse of 'x'
    m<- x$getinv()
    if(!is.null(m)){
        print("Retrieving cached solution")
        m
    } else m<-solve(x$get())
    x$setinv(m)
    m
}
