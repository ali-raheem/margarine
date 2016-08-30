import Data.Char
import Data.List
import Data.List.Split
import Data.Ord
import System.Environment
import System.IO

wordsToList = makeDict . lines
toAlpha = filter isAlpha
wordToLower = map toLower
wordsToAlpha = map toAlpha

hashWord x = sort $ wordToLower x
hashWordList = map hashWord
hashKey = hashWord . toAlpha

findWordInList list key = [word | (k, word) <- list, k == key]

makeDict x = zip (hashWordList lettersOnly) x
             where lettersOnly = wordsToAlpha x

getUserQuery = do
       putStr "Enter letters: "
       hFlush stdout
       getLine
       
main = do
       args <- getArgs
       words <- readFile $ head args
       needle <- getUserQuery
       mapM_ putStrLn $ findWordInList (wordsToList words) $ hashKey needle
