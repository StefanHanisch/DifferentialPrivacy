CREATE PROCEDURE laplacianCount
-- name of the table, which is affected by the query
@table VARCHAR(MAX),
-- class attribute
@attribute VARCHAR(MAX),
-- epsilon
@e FLOAT,
--condition along the path in the tree					
@condition VARCHAR(MAX)
AS
BEGIN
  -- generate a random number by the uniform
  -- distribution between 0 and 1
  -- and shift it by - 0.5 to get values in 
  -- the range of -0.5 and 0.5
  DECLARE @random VARCHAR(20)
  SET @random = ROUND(rand() - 0.5 , 18)

  -- b is the inverse of the epsilon parameter
  DECLARE @b VARCHAR(MAX)
  SET @b = ROUND( 1 / @e , 20)

  -- if @random is equal to 0.5, the
  -- argument of the log function is equals
  -- to 0 and undefined. While @random is 
  -- equals to 0.5, new random numbers 
  -- are generated
  WHILE (ABS(CAST(@random AS FLOAT)) = 0.5)
  BEGIN
    SET @random = ROUND(rand() - 0.5 , 10)
  END

  -- Execute the query and add Laplacian
  -- noise to the outcome. The noisy 
  -- result is rounded and casted to an
  -- integer to get a natural number 
  -- for the count query.
  -- 'quantitiy' denotes the query outcome.

  -- The formula is: quantity - (1 / epsilon * sign (@random * log ( 1 - 2 * Abs(@random))))
  DECLARE @query VARCHAR(MAX)
  SET @query = 'SELECT 
  CAST(
    ROUND
      (COUNT(*) - (' + @b + '* sign(' + @random + ')) * LOG(1-2*ABS(' + @random + '))
    ,0)
  AS int) As quantity 
  FROM ' + @table + ' 
  WHERE ' + @condition

  EXEC(@query)
END