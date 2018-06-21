## These functions take a matrix and create a object/list which is capable of storing both the matrix and its inverse.
## when the inverse is calculated, it is pushed back to this object hence whenever this object is called, either the inverse 
## is given from ache or calculated depending upon how many times the funcation has been called for the same object.

## Tip if a similar object is created with different name but same parameters, one object's cache is not used for another.


## This function will create a list which also contains the value of the Matric along with its Cache. When an inverse is created, 
## it is pushed to the same object / list for storage

makeCacheMatrix <- function(given_regular_matrix = matrix()) {
 
  stored_inverse_matrix <- NULL

## Unsure why the SET function is needed as this is not USED
##  setregular_matrix  <- function(y) {
##    x <<- y
##    stored_matrix <<- NULL
##  }
  
  getregularmatrix <- function() given_regular_matrix
  setinversematrix <- function(given_inverse_matrix) stored_inverse_matrix <<- given_inverse_matrix
  getinversematrix <- function() stored_inverse_matrix
  list(
    ##setregularmatrix = setregularmatrix,
        getregularmatrix = getregularmatrix,
       setinversematrix = setinversematrix,
       getinversematrix = getinversematrix)
}
  
  
   


## The matrix's inverse is stored with the origina matrix(cache) and when the same matrix is passed again, 
## the availibility of inverse is checked and returned is available 

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'

  actual_inverse_matrix <- x$getinversematrix()
  if(!is.null(actual_inverse_matrix)) {
    message("getting cached Inverse Matrix")
    return(actual_inverse_matrix)
  }
  recieved_regular_matrix <- x$getregularmatrix()
  actual_inverse_matrix <- solve(recieved_regular_matrix)
  x$setinversematrix(actual_inverse_matrix)
  actual_inverse_matrix
  
  }
