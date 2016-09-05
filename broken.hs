import Data.Ord
import Data.List
import Data.Char
import Data.List.Split
import System.Environment
import System.IO

lettersOnly = filter isAlpha
wordToLower = map toLower
wordToHash = nub . lettersOnly . wordToLower

canWrite w k = foldr (&&) True (map (`elem` (wordToLower k)) (wordToHash w))

sortByLongest = reverse . (sortBy (comparing length))
longest5 = (take 5) . sortByLongest

getUserQuery = do
  putStr "Enter keys: "
  hFlush stdout
  getLine

--getWordList = do
--  args <- getArgs
--  wordsFile <- readFile $ head args
--  lines wordsFile
  
main = do
  progArgs <- getArgs
  let wordsFileName = head progArgs
  wordsFile <- readFile wordsFileName
  let wordsList = lines wordsFile
--  wordsList <- getWordList
  keys <- getUserQuery

  let words = [w | w <- wordsList, canWrite w keys]
  mapM_ putStrLn $ longest5 words
