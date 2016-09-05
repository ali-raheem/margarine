import Data.Ord
import Data.List
import Data.Char
import Data.List.Split
import System.Environment
import System.IO

lettersOnly = filter isAlpha
wordToLower = map toLower
wordToHash = nub .  wordToLower . lettersOnly

canWrite w k = all (`elem` wordToLower k) (wordToHash w)

sortByLongest = sortBy (flip (comparing length))
longest5 = take 5 . sortByLongest

getUserQuery = do
  putStr "Enter keys: "
  hFlush stdout
  getLine

getWordList = do
  wordFileName:_ <- getArgs
  wordsFile <- readFile wordFileName
  return (lines wordsFile)
  
main = do
  progArgs <- getArgs
  wordsList <- getWordList
  keys <- getUserQuery

  let words = [w | w <- wordsList, canWrite w keys]
  mapM_ putStrLn $ longest5 words
