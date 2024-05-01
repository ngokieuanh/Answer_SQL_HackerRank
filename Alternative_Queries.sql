/*Draw The Triangle 1 */
DECLARE @dtr INT = 20
WHILE @dtr>0 BEGIN SELECT REPLICATE('* ',@dtr) SET @dtr=@dtr-1 end
/*Draw The Triangle 2 */
DECLARE @dtr INT = 1
While @dtr <21 BEGIN SELECT REPLICATE("* ", @dtr) SET @dtr= @dtr+1 END
