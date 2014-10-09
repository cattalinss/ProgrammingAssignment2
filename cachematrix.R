## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## will create an pseudo matrix object and expose get,set,getinverse and sertinverse
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
#the setter function  
  set <- function(value) {
      #value
      x <<- value
      inverse <<- NULL
    }
#the getter function
  get <- function() x

#the setinverse function
  setinverse <- function(inverseval) { inverse <<- inverseval }

#the getinverse function  
  getinverse <- function() { inverse }
#return list of methods
  list( set = set, get = get, setinverse = setinverse, getinverse = getinverse )

}

## Write a short comment describing this function
## implements the caching logic
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  x$get()  
  invers_test <- x$getinverse()
  if(is.null(invers_test)){
    #we must set the inverse
    x$setinverse(solve(x$get()))
  }
  
  # this if is not necessary, just for debugging purpose
  #if(!is.null(invers_test)){
    invers_test <- x$getinverse()
    invers_test
  #}
}
#test code for the 2 functions
test_matrix <- matrix(c(1,2,0,-1,3,-2,2,0,1), 3,3)
invers_r <- makeCacheMatrix(test_matrix)
cacheSolve(invers_r)


