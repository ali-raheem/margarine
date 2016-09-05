import Data.Ord
import Data.List
import Data.Char
import Data.List.Split
import System.Environment
import System.IO

canWrite w k = foldr (&&) True (map (`elem` (map toLower k)) (filter isAlpha (nub (map toLower w))))

getUserQuery = do
  putStr "Enter keys: "
  hFlush stdout
  getLine
  
main = do
  progArgs <- getArgs
  let wordsFileName = head progArgs
  wordsFile <- readFile wordsFileName
  let wordsList = lines wordsFile
  keys <- getUserQuery
  let words = [w | w <- wordsList, canWrite w keys]
  mapM_ putStrLn $ take 5 $ reverse $ sortBy (comparing length) words
